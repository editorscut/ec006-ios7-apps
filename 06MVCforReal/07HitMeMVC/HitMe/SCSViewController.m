#import "SCSViewController.h"
#import "SCSHitMeGame.h"

@interface SCSViewController ()
@property (nonatomic) SCSHitMeGame *game;
@end

@implementation SCSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.game = [[SCSHitMeGame alloc] init];
    [self.game fillAndShuffleDeck];
}

- (IBAction)nextCardButtonTapped:(UIButton *)nextCardButton {
    nextCardButton.enabled = [self.game hasNextCard];
}
@end