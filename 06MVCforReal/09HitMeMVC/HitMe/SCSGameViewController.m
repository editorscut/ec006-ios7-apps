#import "SCSGameViewController.h"
#import "SCSHitMeGame.h"
#import "SCSPlayingCardViewController.h"

@interface SCSGameViewController ()
@property (nonatomic) SCSHitMeGame *game;
@property (nonatomic) SCSPlayingCardViewController *playingCardVC;
@property (nonatomic) SCSPlayingCardViewController *nextCardVC;
@property (weak, nonatomic) IBOutlet UIView *playingCardView;
@property (weak, nonatomic) IBOutlet UIImageView *deckPlaceholderImageView;
@end

@implementation SCSGameViewController
- (void)setUpGame {
    self.game = [[SCSHitMeGame alloc] init];
    [self.game fillAndShuffleDeck];
}
- (void)setUpGameboard {
    self.playingCardVC = [[self childViewControllers] firstObject];
    [UIView animateWithDuration:2.0
                     animations:^{
                         self.deckPlaceholderImageView.alpha = 0;
                         self.playingCardVC.view.alpha = 0;
                     }
                     completion:^(BOOL finished) {
                         [self showNextCard]; //doesn't do anything yet
                     }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpGame];
    [self setUpGameboard];
}
- (void)showNextCard {
    if ([self.game hasNextCard]) {
        [self.playingCardVC displayCard:[self.game nextCard]];
    }
}
- (IBAction)viewDidGetSwipeUp:(UISwipeGestureRecognizer *)sender {
}
@end