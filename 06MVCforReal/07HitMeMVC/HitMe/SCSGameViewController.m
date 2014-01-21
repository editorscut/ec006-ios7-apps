#import "SCSGameViewController.h"
#import "SCSHitMeGame.h"

@interface SCSGameViewController ()
@property (nonatomic) SCSHitMeGame *game;
@end

@implementation SCSGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.game = [[SCSHitMeGame alloc] init];
    [self.game fillAndShuffleDeck];
}

- (IBAction)nextCardButtonTapped:(UIButton *)nextCardButton {
    nextCardButton.enabled = [self.game hasNextCard];
}
@end