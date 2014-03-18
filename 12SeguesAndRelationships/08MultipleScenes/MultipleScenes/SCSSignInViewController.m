#import "SCSSignInViewController.h"

@interface SCSSignInViewController ()<UITextFieldDelegate>
@property (nonatomic, readwrite) NSString *displayName;
@property (weak, nonatomic) IBOutlet UITextField *signInTextField;
@end

@implementation SCSSignInViewController
- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender {
    if ([segue.identifier isEqualToString:@"saveSignIn"]) {
        self.displayName = self.signInTextField.text;
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self performSegueWithIdentifier:@"saveSignIn"
                              sender:self];
    return YES;
}
@end