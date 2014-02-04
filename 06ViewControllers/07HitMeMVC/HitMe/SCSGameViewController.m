#import "SCSGameViewController.h"
#import "SCSHitMeGame.h"

@interface SCSGameViewController ()
@property (nonatomic) SCSHitMeGame *game;
@end

@implementation SCSGameViewController

- (void)setUpGame {
    self.game = [[SCSHitMeGame alloc] init];
    [self.game fillAndShuffleDeck];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpGame];
}

- (IBAction)nextButtonTapped:(UIButton *)nextCardButton {
    nextCardButton.enabled = [self.game hasNextCard];
}
@end