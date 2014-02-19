#import "SCSHitMeGame.h"

@interface SCSMatchMeGame : SCSHitMeGame
/** 
 @discussion The designated initializer.
 @param pairs The number of pairs for this game. 
 This number should be no greater than 13.
 */
- (instancetype)initWithPairs:(NSInteger)pairs;
@end
