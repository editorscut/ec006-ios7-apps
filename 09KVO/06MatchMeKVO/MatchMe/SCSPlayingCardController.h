#import <Foundation/Foundation.h>
@class SCSPlayingCard;

@interface SCSPlayingCardController : NSObject
- (instancetype)initWithPlayingCard:(SCSPlayingCard *)playingCard;
- (void)connectToCell:(UICollectionViewCell *)cell;
@end
