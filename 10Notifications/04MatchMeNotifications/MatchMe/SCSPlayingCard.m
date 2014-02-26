#import "SCSPlayingCard.h"
#import "SCSConstants.h"

@interface SCSPlayingCard ()
@property (nonatomic, readwrite) BOOL isFaceUp;
@end

@implementation SCSPlayingCard

- (void)showCardFace {
    self.isFaceUp = YES;
    NSDictionary *userInfo = @{@"rank":self.rank,
                               @"suit":self.suit,
                               @"color":self.color,
                               @"timestamp":[NSDate date]};
    [[NSNotificationCenter defaultCenter] postNotificationName:SCSPlayingCardDidBecomeFaceUpNotification
                                                        object:self
                                                      userInfo:userInfo];
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
