#import "SCSDetailTableViewController.h"

@interface SCSDetailTableViewController ()
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@end

@implementation SCSDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.foodLocationItem.name;
    [self configureMapView];
    self.phoneLabel.text = [self phoneNumberDisplayText];
}
- (void)configureMapView {
}

- (NSString *)phoneNumberDisplayText {
    if (self.foodLocationItem.phoneNumber) {
        return self.foodLocationItem.phoneNumber;
    } else {
        return @"<none available>";
    }
}
@end
