#import "SCSGameBoardViewController.h"
#import "SCSMatchMeGame.h"
#import "SCSPlayingCardController.h"

@interface SCSGameBoardViewController ()
@property (nonatomic) SCSMatchMeGame *game;
@property (nonatomic) NSArray *playingCardControllers;
@end

@implementation SCSGameBoardViewController

- (void)dealCards {
        NSMutableArray *tempControllers = [[NSMutableArray alloc] initWithCapacity:[self numberOfCards]];
        for (int i = 0; i < [self numberOfCards]; i++) {
            [tempControllers addObject:[[SCSPlayingCardController alloc] initWithPlayingCard: [self.game nextCard]]];
        }
        self.playingCardControllers = tempControllers;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpGame];
    [self dealCards];
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
    UICollectionViewCell *playingCardCell
        = [collectionView dequeueReusableCellWithReuseIdentifier:@"PlayingCardCell"
                                                    forIndexPath:indexPath];
    SCSPlayingCardController *controllerForCell = self.playingCardControllers[indexPath.item];
    [controllerForCell connectToCell:playingCardCell];
    return playingCardCell;
}
- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    SCSPlayingCardController *selectedController = self.playingCardControllers[indexPath.item];
    [selectedController didTapCell];
}
@end