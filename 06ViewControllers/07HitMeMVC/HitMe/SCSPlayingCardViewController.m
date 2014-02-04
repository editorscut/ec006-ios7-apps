#import "SCSPlayingCardViewController.h"
#import "SCSPlayingCard.h"

@interface SCSPlayingCardViewController ()
@property (weak, nonatomic) IBOutlet UILabel *playingCardLabel;
@property (weak, nonatomic) IBOutlet UIImageView *playingCardBackImageView;
@property (nonatomic, readwrite) SCSPlayingCard *playingCard;
@end

@implementation SCSPlayingCardViewController

- (void)displayCard:(SCSPlayingCard *)playingCard {
    self.playingCard = playingCard;
    self.playingCardLabel.textColor = self.playingCard.color;
    self.playingCardLabel.text = [NSString stringWithFormat:@"%@ %@", self.playingCard.rank, self.playingCard.suit];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (IBAction)viewTappedToFlipCard:(UITapGestureRecognizer *)sender {
    [UIView animateWithDuration:.25
                     animations:^{
                         self.view.transform = CGAffineTransformMakeScale(0.01,1);
                         self.view.center = CGPointMake(self.view.center.x + self.view.frame.size.width/2, self.view.center.y);
                     } completion:^(BOOL finished) {
                         self.playingCardBackImageView.hidden = ! self.playingCardBackImageView.hidden;
                         [UIView animateWithDuration:.25
                                          animations:^{
                                              self.view.transform = CGAffineTransformIdentity;
                                          }];
                     }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.layer.cornerRadius = self.view.frame.size.width/32;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
