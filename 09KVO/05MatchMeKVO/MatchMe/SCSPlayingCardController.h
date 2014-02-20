#import <Foundation/Foundation.h>
@class SCSPlayingCard;
@class SCSPlayingCardCell;

@interface SCSPlayingCardController : NSObject
- (instancetype)initWithPlayingCard:(SCSPlayingCard *)playingCard;
- (void)connectToCell:(SCSPlayingCardCell *)cell;
@end
