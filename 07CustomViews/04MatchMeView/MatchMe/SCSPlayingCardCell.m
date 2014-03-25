


#import "SCSPlayingCardCell.h"

@interface SCSPlayingCardCell ()
@property (weak, nonatomic) IBOutlet UILabel *playingCardLabel;
@end

@implementation SCSPlayingCardCell 

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.cornerRadius = self.frame.size.width/16;
    [self customizeLabel];
}

- (NSString *)labelContentString {
    return self.playingCardLabel.text;
}
- (NSDictionary *)labelAttributes {
    return @{NSStrokeColorAttributeName:[self goldColor],
          NSForegroundColorAttributeName:self.playingCardLabel.textColor,
          NSStrokeWidthAttributeName:@(-5),
          NSFontAttributeName:[UIFont boldSystemFontOfSize:20]};
}

- (void)customizeLabel {
       self.playingCardLabel.attributedText = [[NSAttributedString alloc] initWithString:[self labelContentString]
                                                                              attributes:[self labelAttributes]];
}
- (UIColor *)goldColor {
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
    [[self goldColor] setStroke];
    [bezierPath stroke];
}
@end
