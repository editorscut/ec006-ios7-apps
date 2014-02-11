#import "SCSHitMeGame.h"
#import "SCSPlayingCard.h"
#import "SCSDeck.h"
#import "SCSHitMeGame_Private.h"


@implementation SCSHitMeGame

- (id)init {
    self = [super init];
    if (self) {
        _deck = [[SCSDeck alloc] init];
    }
    return self;
}

- (NSArray *)validRanks {
    if ( ! _validRanks) {
        _validRanks =  @[@"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
    }
    return _validRanks;
}
- (NSArray *)validSuits {
    if ( ! _validSuits) {
        _validSuits = @[@"♣︎", @"♠︎", @"♥︎", @"♦︎"];
    }
    return _validSuits;
}
- (NSDictionary *)colorForSuit {
    if ( ! _colorForSuit) {
        _colorForSuit = @{@"♣︎":[UIColor blackColor],
                          @"♠︎":[UIColor blackColor],
                          @"♥︎":[UIColor redColor],
                          @"♦︎":[UIColor redColor]};
    }
    return _colorForSuit;
}

- (void)fillAndShuffleDeck {
    [self fillDeck];
    [self shuffleDeck];
}
- (void)fillDeck {
    for (NSString *rank in self.validRanks) {
        for (NSString *suit in self.validSuits) {
            [self.deck addCard:[[SCSPlayingCard alloc]initWithRank:rank
                                                              suit:suit
                                                             color:self.colorForSuit[suit]]];
        }
    }
}
- (void)shuffleDeck {
    [self.deck shuffleDeck];
}

- (SCSPlayingCard *)nextCard {
    return [self.deck dealNextCard];
}
- (BOOL)hasNextCard {
    return ([self.deck showNextCard] != nil);
}
@end
