#import "SCSFoodLocationTableViewController.h"

@interface SCSFoodLocationTableViewController ()
@property (nonatomic) NSArray *foodLocations;
@end

@implementation SCSFoodLocationTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.foodLocations = @[@"Dan's Diner", @"Kim's Kitchen", @"Chez Maggie", @"Anabelle's Snack Shop"];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return [self.foodLocations count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FoodLocationCell"
                                                            forIndexPath:indexPath];
    cell.textLabel.text = self.foodLocations[indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Location #%d", indexPath.row + 1];
    return cell;
}


@end
