#import "SCSPlayingCard.h"

@implementation SCSPlayingCard

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
