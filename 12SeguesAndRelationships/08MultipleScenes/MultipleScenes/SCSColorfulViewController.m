#import "SCSColorfulViewController.h"

@implementation SCSColorfulViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = self.displayColor;
    self.navigationItem.title = self.displayColorName;
}
@end
