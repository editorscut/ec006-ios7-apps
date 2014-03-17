#import "SCSViewController.h"
#import "SCSColorfulViewController.h"

@interface SCSViewController ()
@end

@implementation SCSViewController
- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender {
    SCSColorfulViewController *colorfulVC = segue.destinationViewController;
    if ([segue.identifier isEqualToString:@"blue"]) {
        colorfulVC.displayColor = [UIColor blueColor];
        colorfulVC.displayColorName = @"Blue";
    } else if ([segue.identifier isEqualToString:@"red"]){
        colorfulVC.displayColor = [UIColor redColor];
        colorfulVC.displayColorName = @"Red";
    }
}
@end
