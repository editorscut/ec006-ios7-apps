#import "SCSMatchMeGame.h"
#import "SCSHitMeGame_Private.h"
#import "SCSDeck.h"
#import "SCSConstants.h"

@interface SCSMatchMeGame ()
@property (nonatomic) NSInteger pairs;
@end

@implementation SCSMatchMeGame
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:SCSPlayingCardDidBecomeFaceUpNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:SCSPlayingCardCellDidFinishFlippingCardNotification
                                                  object:nil];
}
- (instancetype)initWithPairs:(NSInteger)pairs {
    self = [super init];
    if (self) {
        _pairs = pairs;
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(playingCardDidGetTurnedFaceUp:)
                                                     name:SCSPlayingCardDidBecomeFaceUpNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(playingCardDidCompleteAnimatingToFaceUp:)
                                                     name:SCSPlayingCardCellDidFinishFlippingCardNotification
                                                   object:nil];
    }
    return self;
}
- (void)playingCardDidGetTurnedFaceUp:(NSNotification *)notification {
    NSLog(@"%@", notification);
}
- (void)playingCardDidCompleteAnimatingToFaceUp:(NSNotification *)notification {
    NSLog(@"%@", notification);
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
- (NSArray *)suitsForRank {
    NSMutableArray *suitsForRank = [self.validSuits mutableCopy];
    while ([suitsForRank count] > 2) {
        int randomSuit = arc4random()%[suitsForRank count];
        [suitsForRank removeObjectAtIndex:randomSuit];
    }
    return suitsForRank;
}
- (void)fillDeck {
    self.deck = [[SCSDeck alloc] init];
    [[self ranksForMatchGame] enumerateObjectsUsingBlock:^(NSString *rank,
                                                           NSUInteger indexRank,
                                                           BOOL *stopRank) {
        [[self suitsForRank] enumerateObjectsUsingBlock:^(NSString *suit,
                                                          NSUInteger indexSuit,
                                                          BOOL *stopSuit) {
            [self.deck addCardWithRank:rank
                                  suit:suit
                                 color:self.colorForSuit[suit]];
        }];
    }];
}
@end