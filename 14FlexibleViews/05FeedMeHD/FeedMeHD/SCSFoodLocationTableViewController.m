#import "SCSFoodLocationTableViewController.h"
#import "SCSFoodLocator.h"
#import "SCSDetailTableViewController.h"
@import MapKit;

@interface SCSFoodLocationTableViewController ()
@property (nonatomic) NSArray *foodLocations;
@end

@implementation SCSFoodLocationTableViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    [[SCSFoodLocator sharedFoodLocator] findNearbyFoodWithCompletionHandler:^(NSArray *response) {
        self.foodLocations = [[NSArray alloc] initWithArray:response];
        [self.tableView reloadData];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return [self.foodLocations count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FoodLocationCell"
                                                            forIndexPath:indexPath];
    MKMapItem *item = self.foodLocations[indexPath.row];
    cell.textLabel.text = item.name;
    if (item.url) {
        cell.detailTextLabel.text = [item.url absoluteString];
    } else {
        cell.detailTextLabel.text = @"(no web site)";
    }
    return cell;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender {
    MKMapItem *selectedItem = self.foodLocations[[self.tableView indexPathForSelectedRow].row];
    if ([segue.identifier isEqualToString:@"showDetailTableView"]) {
        SCSDetailTableViewController *detailTVC = segue.destinationViewController;
        detailTVC.foodLocationItem = selectedItem;
    }
}

@end
