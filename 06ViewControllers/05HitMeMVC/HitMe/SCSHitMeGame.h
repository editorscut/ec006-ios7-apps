#import <Foundation/Foundation.h>
@class SCSPlayingCard;

@interface SCSHitMeGame : NSObject
- (BOOL)hasNextCard;
- (SCSPlayingCard *)nextCard;
- (void)fillAndShuffleDeck;
@end