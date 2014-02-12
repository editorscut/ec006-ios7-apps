#import "SCSGameBoardViewController.h"
#import "SCSPlayingCardCell.h"
#import "SCSMatchMeGame.h"
#import "SCSPlayingCardController.h"

@interface SCSGameBoardViewController ()
@property (nonatomic) SCSMatchMeGame *game;
@property (nonatomic) NSArray *playingCardControllers;
@end

@implementation SCSGameBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpGame];
}

- (void)setUpGame {
    self.game = [[SCSMatchMeGame alloc]initWithPairs:[self numberOfPairs]];
    [self.game fillAndShuffleDeck];
}



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
- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    SCSPlayingCardCell *selectedCell = (SCSPlayingCardCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [selectedCell didReceiveTap];
}
@end