#import "SCSPlayingCardCell.h"
#import "SCSConstants.h"

@interface SCSPlayingCardCell ()
@property (weak, nonatomic) IBOutlet UILabel *playingCardLabel;
@end

@implementation SCSPlayingCardCell 

- (void)refreshView {
    self.layer.cornerRadius = self.frame.size.width/16;
    [self customizeLabel];
    [self configureBackOfCard];
}

- (void)configureBackOfCard {
    self.backgroundView = [self.dataSource imageViewForBackOfPlayingCardCell:self];
}
- (NSString *)labelContentString {
    if (self.dataSource) {
        return [self.dataSource contentStringForPlayingCardCell:self];
    } else {
        return @"";
    }
}
- (UIColor *)labelContentColor {
    if (self.dataSource) {
        return [self.dataSource colorForPlayingCardCell:self];
    } else {
        return [UIColor blackColor];
    }
}
- (NSDictionary *)labelAttributes {
    return @{NSStrokeColorAttributeName:[self accentColor],
             NSForegroundColorAttributeName:[self labelContentColor],
             NSStrokeWidthAttributeName:@(-5),
             NSFontAttributeName:[UIFont boldSystemFontOfSize:20]};
}

- (void)customizeLabel {
       self.playingCardLabel.attributedText = [[NSAttributedString alloc] initWithString:[self labelContentString]
                                                                              attributes:[self labelAttributes]];
}
- (UIColor *)accentColor {
    return [UIColor colorWithRed:1 green:.8 blue:0 alpha:1];
}
- (CGRect)innerRectForRect:(CGRect)rect {
    CGFloat margin = rect.size.width/15;
    return CGRectMake(margin, margin, rect.size.width - 2 * margin, rect.size.height - 2 * margin);
}
-(void)drawRect:(CGRect)rect {
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:[self innerRectForRect:rect]
                                                          cornerRadius:3];
    bezierPath.lineWidth = 2;
    [[self accentColor] setStroke];
    [bezierPath stroke];
}
- (void)didReceiveTapToDisplayCardFaceUp:(BOOL)isFaceUp {
    [UIView animateWithDuration:.15
                     animations:[self flipHalfway]
                     completion:^(BOOL finished) {
                         [self displayCardFaceUp:isFaceUp];
                         [self animateFlipTheRestOfTheWayAndNotify:isFaceUp];
                     }];
}
- (void)displayCardFaceUp:(BOOL)isFaceUp {
    self.backgroundView.hidden = isFaceUp;
    self.playingCardLabel.hidden = ! isFaceUp;
}
- (void(^)(void))flipHalfway {
    return ^{
        self.transform = CGAffineTransformMakeScale(0.01,1);
        self.center = CGPointMake(self.center.x + self.frame.size.width/2,
                                  self.center.y);
    };
}
- (void(^)(void))flipTheRestOfTheWay {
    return ^{
        self.transform = CGAffineTransformIdentity;
    };
}
- (void)animateFlipTheRestOfTheWayAndNotify:(BOOL)notify {
    [UIView animateWithDuration:.15
                     animations:[self flipTheRestOfTheWay]
                     completion:^(BOOL finished) {
                         if (notify) {
                             [[NSNotificationCenter defaultCenter] postNotificationName:SCSPlayingCardCellDidFinishFlippingCardNotification
                                                                                 object:self];
                         };
                     }];
}

- (void)awakeFromNib {
    [self addObserver:self
           forKeyPath:@"selected"
              options:NSKeyValueObservingOptionNew
              context:NULL];
}
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    if ([keyPath isEqualToString:@"isFaceUp"]) {
        NSNumber *isFaceUp = change[@"new"];
        [self didReceiveTapToDisplayCardFaceUp:[isFaceUp boolValue]];
    }
}

@end
