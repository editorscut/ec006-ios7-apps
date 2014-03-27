#import "SCSDetailTableViewController.h"
#import "SCSFoodLocator.h"

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
    self.mapView.showsUserLocation = YES;
    self.mapView.region = [[SCSFoodLocator sharedFoodLocator] mapRegionForFoodLocation:self.foodLocationItem.placemark];
}

- (NSString *)phoneNumberDisplayText {
    if (self.foodLocationItem.phoneNumber) {
        return self.foodLocationItem.phoneNumber;
    } else {
        return @"<none available>";
    }
}
@end
