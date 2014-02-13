#import "SCSGameBoardViewController.h"
#import "SCSPlayingCardCell.h"
#import "SCSMatchMeGame.h"
#import "SCSPlayingCardController.h"

@interface SCSGameBoardViewController ()
@property (nonatomic) SCSMatchMeGame *game;
@property (nonatomic) NSArray *playingCardControllers;
@end

@implementation SCSGameBoardViewController

- (NSArray *)playingCardControllers {
    if ( ! _playingCardControllers) {
        NSMutableArray *tempControllers = [[NSMutableArray alloc] initWithCapacity:[self numberOfCards]];
        for (int i = 0; i < [self numberOfCards]; i++) {
            [tempControllers addObject:[[SCSPlayingCardController alloc] initWithPlayingCard: [self.game nextCard]]];
        }
        _playingCardControllers = tempControllers;
    }
    return _playingCardControllers;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpGame];
}

- (void)setUpGame {
    self.game = [[SCSMatchMeGame alloc]initWithPairs:[self numberOfPairs]];
    [self.game fillAndShuffleDeck];
}
- (NSInteger)numberOfCards {
    return 2 * [self numberOfPairs];
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
    SCSPlayingCardCell *playingCardCell
        = [collectionView dequeueReusableCellWithReuseIdentifier:@"PlayingCardCell"
                                                    forIndexPath:indexPath];
    playingCardCell.dataSource = self.playingCardControllers[indexPath.row];
    [playingCardCell refreshView];
    return playingCardCell;
}
- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    SCSPlayingCardCell *selectedCell = (SCSPlayingCardCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [selectedCell didReceiveTap];
}
@end