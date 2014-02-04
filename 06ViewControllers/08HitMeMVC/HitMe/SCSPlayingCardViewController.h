#import <UIKit/UIKit.h>
@class SCSPlayingCard;

@interface SCSPlayingCardViewController : UIViewController
@property (nonatomic, readonly) SCSPlayingCard *playingCard;
- (void)displayCard:(SCSPlayingCard *)playingCard;
@end