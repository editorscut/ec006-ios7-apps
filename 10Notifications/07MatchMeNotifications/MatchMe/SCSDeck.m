#import "SCSDeck.h"
#import "SCSPlayingCard.h"

@interface SCSDeck ()
@property (nonatomic) NSMutableArray *cards;
@end

@implementation SCSDeck

- (NSMutableArray *)cards {
    if ( ! _cards) {
        _cards = [[NSMutableArray alloc] initWithCapacity:100];
    }
    return _cards;
}
- (NSUInteger)numberOfCardsInDeck {
    return [self.cards count];
}
- (void)addCard:(SCSPlayingCard *)card {
    [self.cards addObject:card];
}
- (void)addCardWithRank:(NSString *)rank
                   suit:(NSString *)suit
                  color:(UIColor *)color {
    SCSPlayingCard *card = [[SCSPlayingCard alloc] initWithRank:rank
                                                           suit:suit
                                                          color:color];
    [self.cards addObject:card];
}
- (SCSPlayingCard *)showNextCard {
    return [self.cards firstObject];
}
- (SCSPlayingCard *)dealNextCard {
    SCSPlayingCard *cardToDeal = [self.cards firstObject];
    if (cardToDeal) {
        [self.cards removeObjectAtIndex:0];
    }
    return cardToDeal;
}
- (void)shuffleDeck {
    [self.cards enumerateObjectsUsingBlock:^(SCSPlayingCard *card,
                                             NSUInteger index,
                                             BOOL *stop) {
        [self.cards exchangeObjectAtIndex:index
                        withObjectAtIndex:arc4random()%[self.cards count]];
    }];
}
@end
