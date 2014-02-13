#import <UIKit/UIKit.h>
@protocol SCSPlayingCardCellDataSource;

@interface SCSPlayingCardCell : UICollectionViewCell
@property (weak, nonatomic) id<SCSPlayingCardCellDataSource>dataSource;
- (void)didReceiveTap;
- (void)refreshView;
@end

@protocol SCSPlayingCardCellDataSource <NSObject>
- (NSString *)contentStringForPlayingCardCell:(SCSPlayingCardCell *)playingCardCell;
- (UIColor *)colorForPlayingCardCell:(SCSPlayingCardCell *)playingCardCell;
- (UIImageView *)imageViewForBackOfPlayingCardCell:(SCSPlayingCardCell *)playingCardCell;
@end