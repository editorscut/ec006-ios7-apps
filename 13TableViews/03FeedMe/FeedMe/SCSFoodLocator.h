#import <Foundation/Foundation.h>

typedef void(^SCSFoodResultsReader)(NSArray *response);

@interface SCSFoodLocator : NSObject
+ (instancetype)sharedFoodLocator;
- (void)findNearbyFoodWithCompletionHandler:(SCSFoodResultsReader)resultsReader;
@end