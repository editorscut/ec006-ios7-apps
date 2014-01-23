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
                         [self showNextCard];
                     }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpGame];
    [self setUpGameboard];
}
- (void)createNextCard {
    self.nextCardVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PlayingCardScene"];
    self.nextCardVC.view.frame = self.deckPlaceholderImageView.frame;
    [self.view addSubview:self.nextCardVC.view];
    self.nextCardVC.view.alpha = 0;
    self.nextCardVC.isFaceUp = self.playingCardVC.isFaceUp;
    [UIView animateWithDuration:1.0
                     animations:^{
                         self.nextCardVC.view.alpha = 1;
                     }];
}
- (void)showNextCard {
    if ([self.game hasNextCard]) {
        [self createNextCard];
        [self.nextCardVC displayCard:[self.game nextCard]];
    }
}
- (IBAction)viewDidGetSwipeUp:(UISwipeGestureRecognizer *)sender {
    [UIView animateWithDuration:1
                     animations:^{
                         self.nextCardVC.view.frame = self.playingCardView.frame;
                         self.playingCardVC.view.alpha = 0;
                     } //...
     completion:^(BOOL finished) {
         self.playingCardVC = self.nextCardVC;
         [self showNextCard];
     }];
}
@end