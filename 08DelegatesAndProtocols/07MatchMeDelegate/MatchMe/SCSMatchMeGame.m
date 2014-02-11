#import "SCSMatchMeGame.h"
#import "SCSHitMeGame_Private.h"

@interface SCSMatchMeGame ()
@property (nonatomic) NSInteger pairs;
@end

@implementation SCSMatchMeGame
- (instancetype)initWithPairs:(NSInteger)pairs {
    self = [super init];
    if (self) {
        _pairs = pairs;
    }
    return self;
}
- (instancetype)init {
    return [self initWithPairs:0];
}
- (NSArray *)ranksForMatchGame {
    NSMutableArray *ranksForMatchGame = [self.validRanks mutableCopy];
    while ([ranksForMatchGame count] > self.pairs) {
        int randomRank = arc4random()%[ranksForMatchGame count];
        [ranksForMatchGame removeObjectAtIndex:randomRank];
    }
    return ranksForMatchGame;
}
@end
