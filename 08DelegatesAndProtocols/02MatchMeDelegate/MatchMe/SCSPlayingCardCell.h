#import <UIKit/UIKit.h>

@interface SCSPlayingCardCell : UICollectionViewCell
- (void)didReceiveTap;
@end

@protocol SCSPlayingCardCellDataSource <NSObject>
- (NSString *)contentStringForPlayingCardCell:(SCSPlayingCardCell *)playingCardCell;
- (UIColor *)colorForPlayingCardCell:(SCSPlayingCardCell *)playingCardCell;
- (UIImageView *)imageViewForBackOfPlayingCardCell:(SCSPlayingCardCell *)playingCardCell;
@end