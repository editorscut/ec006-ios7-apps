#import <UIKit/UIKit.h>
@import MapKit;

@interface SCSDetailTableViewController : UITableViewController
@property (nonatomic) MKMapItem *foodLocationItem;
- (void)updateDisplay;
@end
