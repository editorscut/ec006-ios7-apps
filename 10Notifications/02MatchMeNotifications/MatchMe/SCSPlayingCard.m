#import "SCSPlayingCard.h"

@interface SCSPlayingCard ()
@property (nonatomic, readwrite) BOOL isFaceUp;
@end

@implementation SCSPlayingCard

- (void)showCardFace {
    self.isFaceUp = YES;
}
- (void)hideCardFace {
    self.isFaceUp = NO;
} 
- (instancetype)initWithRank:(NSString *)rank
                        suit:(NSString *)suit
                       color:(UIColor *)color {
    self = [super init];
    if (self) {
        _rank = rank;
        _suit = suit;
        _color = color;
    }
    return self;
}
- (instancetype)init {
    return [self initWithRank:nil
                         suit:nil
                        color:nil];
}
@end
