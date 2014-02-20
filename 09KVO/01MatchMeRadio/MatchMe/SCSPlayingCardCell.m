#import "SCSPlayingCardCell.h"

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
- (void)didReceiveTap {
    [UIView animateWithDuration:.15
                     animations:[self flipHalfway]
                     completion:^(BOOL finished) {
                         [self reverseCard];
                         [self animateFlipTheRestOfTheWay];
                     }];
}
- (void)reverseCard {
    self.backgroundView.hidden = ! self.backgroundView.hidden;
    self.playingCardLabel.hidden = ! self.playingCardLabel.hidden;
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
- (void)animateFlipTheRestOfTheWay {
    [UIView animateWithDuration:.15
                     animations:[self flipTheRestOfTheWay]];
}


@end
