#import <Foundation/Foundation.h>
@class SCSPlayingCard;

@interface SCSHitMeGame : NSObject
- (SCSPlayingCard *)nextCard;
- (void)fillAndShuffleDeck;
@end