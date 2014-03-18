#import "SCSNameViewController.h"
#import "SCSSignInViewController.h"

@interface SCSNameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@end

@implementation SCSNameViewController
- (IBAction)cancelSignIn:(UIStoryboardSegue *)segue {}
- (IBAction)saveSignIn:(UIStoryboardSegue *)segue {
    if ([segue.identifier isEqualToString:@"saveSignIn"]) {
        SCSSignInViewController *signInVC = segue.sourceViewController;
        self.usernameLabel.text = signInVC.displayName;
    }
}
@end
