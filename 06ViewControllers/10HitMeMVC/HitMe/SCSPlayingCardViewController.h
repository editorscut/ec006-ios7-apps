#import <UIKit/UIKit.h>
@class SCSPlayingCard;

@interface SCSPlayingCardViewController : UIViewController
@property (nonatomic, readonly) SCSPlayingCard *playingCard;
@property (nonatomic) BOOL isFaceUp;
- (void)displayCard:(SCSPlayingCard *)playingCard;
@end