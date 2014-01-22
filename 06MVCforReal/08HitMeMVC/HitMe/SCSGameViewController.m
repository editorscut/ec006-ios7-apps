#import "SCSGameViewController.h"
#import "SCSHitMeGame.h"
#import "SCSPlayingCardViewController.h"

@interface SCSGameViewController ()
@property (nonatomic) SCSHitMeGame *game;
@property (nonatomic) SCSPlayingCardViewController *playingCardVC;
@end

@implementation SCSGameViewController

- (void)setUpGame {
    self.game = [[SCSHitMeGame alloc] init];
    [self.game fillAndShuffleDeck];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpGame];
    self.playingCardVC = [[self childViewControllers] firstObject];
    [self showNextCard];
}
- (void)showNextCard {
    if ([self.game hasNextCard]) {
        [self.playingCardVC displayCard:[self.game nextCard]];
    }
}
- (IBAction)nextButtonTapped:(UIButton *)nextCardButton {
    [self showNextCard];
    nextCardButton.enabled = [self.game hasNextCard];
}
@end