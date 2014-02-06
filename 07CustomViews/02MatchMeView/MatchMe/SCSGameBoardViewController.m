#import "SCSGameBoardViewController.h"
#import "SCSPlayingCardCell.h"

@implementation SCSGameBoardViewController

- (NSInteger)numberOfPairs {
    return 6;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return 2 * [self numberOfPairs];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SCSPlayingCardCell *playingCardCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PlayingCardCell"
                                                                                    forIndexPath:indexPath];
    return playingCardCell;
    
}
@end