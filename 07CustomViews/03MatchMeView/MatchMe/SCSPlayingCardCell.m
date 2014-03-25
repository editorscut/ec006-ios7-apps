#import "SCSPlayingCardCell.h"

@implementation SCSPlayingCardCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.cornerRadius = self.frame.size.width/16;
}
- (UIColor *)goldColor {
    return [UIColor colorWithRed:1 green:0.8 blue:0 alpha:1.0];
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
