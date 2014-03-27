#import <Foundation/Foundation.h>
@import MapKit;

typedef void(^SCSFoodResultsReader)(NSArray *response);

@interface SCSFoodLocator : NSObject
+ (instancetype)sharedFoodLocator;
- (void)findNearbyFoodWithCompletionHandler:(SCSFoodResultsReader)resultsReader;
- (MKCoordinateRegion)mapRegionForFoodLocation:(MKPlacemark *)foodLocationPlacemark;
@end