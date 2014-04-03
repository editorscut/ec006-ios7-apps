#import "SCSDetailTableViewController.h"
#import "SCSFoodLocator.h"
#import "MKPlacemark+SCSPinView.h"
#import "SCSWebViewController.h"

@interface SCSDetailTableViewController ()
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UITableViewCell *phoneCell;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@end

@implementation SCSDetailTableViewController

- (void)updateDisplay {
    self.navigationItem.title = self.foodLocationItem.name;
    [self configureMapView];
    self.phoneLabel.text = [self phoneNumberDisplayText];
    [self configureAccessory];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateDisplay];
}
- (void)configureMapView {
    self.mapView.showsUserLocation = YES;
    self.mapView.region = [[SCSFoodLocator sharedFoodLocator] mapRegionForFoodLocation:self.foodLocationItem.placemark];
    [self.mapView removeAnnotations:self.mapView.annotations];
    [self.mapView addAnnotation:self.foodLocationItem.placemark];
}

- (NSString *)phoneNumberDisplayText {
    if (self.foodLocationItem.phoneNumber) {
        return self.foodLocationItem.phoneNumber;
    } else {
        return @"<none available>";
    }
}
- (void)configureAccessory{
    if (self.foodLocationItem.url) {
        self.phoneCell.accessoryType = UITableViewCellAccessoryDetailButton;
    } else {
        self.phoneCell.accessoryType = UITableViewCellAccessoryNone;
    }
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showWebView"]) {
        SCSWebViewController *webVC = segue.destinationViewController;
        webVC.url = self.foodLocationItem.url;
    }
}
@end
