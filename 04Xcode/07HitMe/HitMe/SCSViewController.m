#import "SCSViewController.h"

@interface SCSViewController ()
@property (weak, nonatomic) IBOutlet UILabel *playingCardLabel;
@end

@implementation SCSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.playingCardLabel.layer.cornerRadius
        = self.playingCardLabel.frame.size.width/12;
    self.playingCardLabel.text = @"A ♣︎";
}

- (IBAction)flipCardButtonTapped:(UIButton *)sender {
    if ([self.playingCardLabel.textColor isEqual:[UIColor whiteColor]]) {
        self.playingCardLabel.textColor = [UIColor blackColor];
    } else self.playingCardLabel.textColor = [UIColor whiteColor];
}

- (IBAction)nextCardButtonTapped:(UIButton *)sender {
    if ([self.playingCardLabel.text isEqualToString:@"A ♣︎"]) {
        self.playingCardLabel.text = @"3 ♠︎";
    } else self.playingCardLabel.text = @"A ♣︎";
}




@end
