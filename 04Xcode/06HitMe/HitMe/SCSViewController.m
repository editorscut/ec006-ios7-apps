#import "SCSViewController.h"

@interface SCSViewController ()
@property (weak, nonatomic) IBOutlet UILabel *playingCardLabel;
@end

@implementation SCSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.playingCardLabel.layer.cornerRadius = self.playingCardLabel.frame.size.width/12;
    self.playingCardLabel.text = @"A ♣︎";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
