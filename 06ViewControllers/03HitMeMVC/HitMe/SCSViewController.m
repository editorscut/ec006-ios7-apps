#import "SCSViewController.h"
#import "SCSHitMeGame.h"
#import "SCSPlayingCard.h"

@interface SCSViewController ()
@property (weak, nonatomic) IBOutlet UILabel *playingCardLabel;
@property (nonatomic) SCSHitMeGame *game;
@property (nonatomic) BOOL isFaceDown;
@property (nonatomic) SCSPlayingCard *currentPlayingCard;
@end

@implementation SCSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.game = [[SCSHitMeGame alloc] init];
    [self.game fillAndShuffleDeck];
    [self getNextCard];
}

- (void)redrawCard {
    self.playingCardLabel.text
         = [NSString stringWithFormat:@"%@ %@", self.currentPlayingCard.rank,
                                                self.currentPlayingCard.suit];
    if ( self.isFaceDown) {
        self.playingCardLabel.textColor = [UIColor whiteColor];
    } else {
        self.playingCardLabel.textColor = self.currentPlayingCard.color;
    }
}

- (IBAction)flipCardButtonTapped:(UIButton *)sender {
    self.isFaceDown = ! self.isFaceDown;
    [self redrawCard];
}

- (void)getNextCard {
    self.currentPlayingCard = [self.game nextCard];
    [self redrawCard];
}

- (IBAction)nextCardButtonTapped:(UIButton *)nextCardButton {
    [self getNextCard];
    nextCardButton.enabled = [self.game hasNextCard];
}
@end