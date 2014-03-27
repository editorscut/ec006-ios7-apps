#import "SCSFoodLocator.h"
@import CoreLocation;
@import MapKit;

@interface SCSFoodLocator ()<CLLocationManagerDelegate>
@property (copy, nonatomic) SCSFoodResultsReader resultsReader;
@property (nonatomic) CLLocationManager *locationManager;
@property (nonatomic) CLLocation *userLocation;
@end

@implementation SCSFoodLocator
+ (instancetype)sharedFoodLocator {
    static id _sharedFoodLocator = nil;
    static dispatch_once_t createLocatorOnceToken;
    dispatch_once(&createLocatorOnceToken, ^{
        _sharedFoodLocator = [[self alloc] init];
    });
    return _sharedFoodLocator;
}
- (void)findNearbyFoodWithCompletionHandler:(SCSFoodResultsReader)resultsReader{
    self.resultsReader = resultsReader;
    [self findUserLocation];
}
- (void)findUserLocation {
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager startUpdatingLocation];
    self.locationManager.pausesLocationUpdatesAutomatically = YES;
}
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations {
    self.userLocation = [locations lastObject];
    if (self.userLocation) {
        [self startLocalSearchForFood];
    }
}
- (void)startLocalSearchForFood {
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    request.naturalLanguageQuery = @"food";
    request.region = MKCoordinateRegionMakeWithDistance(self.userLocation.coordinate, 5000, 5000);
    MKLocalSearch *searchForFood = [[MKLocalSearch alloc] initWithRequest:request];
    [searchForFood startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        if ( ! response) {
            NSLog(@"Error receiving results: %@", error);
        } else {
            if (self.resultsReader) {
                self.resultsReader(response.mapItems);
            }
        }
    }];
}
@end
