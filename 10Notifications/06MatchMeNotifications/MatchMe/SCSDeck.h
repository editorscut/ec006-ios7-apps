#import <Foundation/Foundation.h>
@class SCSPlayingCard;

@interface SCSDeck : NSObject
- (NSUInteger)numberOfCardsInDeck;
- (void)addCardWithRank:(NSString *)rank
                   suit:(NSString *)suit
                  color:(UIColor *)color;
- (SCSPlayingCard *)showNextCard;
- (SCSPlayingCard *)dealNextCard;
- (void)shuffleDeck;
@end