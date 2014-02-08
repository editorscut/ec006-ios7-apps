#import <Foundation/Foundation.h>
@class SCSPlayingCard;

@interface SCSDeck : NSObject
- (NSUInteger)numberOfCardsInDeck;
- (void)addCard:(SCSPlayingCard *)card;
- (SCSPlayingCard *)showNextCard;
- (SCSPlayingCard *)dealNextCard;
- (void)shuffleDeck;
@end