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
- (MKCoordinateRegion)mapRegionForFoodLocation:(MKPlacemark *)foodLocationPlacemark {
    CLLocation *center = [self halfwayBetweenStart:self.userLocation.coordinate
                                               end:foodLocationPlacemark.coordinate];
    CLLocationDistance distance = [self distanceBetweenStart:self.userLocation
                                                         end:foodLocationPlacemark.location];
    return MKCoordinateRegionMakeWithDistance(center.coordinate, 1.4 * distance,1.4 * distance);
}

- (CLLocation *)halfwayBetweenStart:(CLLocationCoordinate2D)start
                                end:(CLLocationCoordinate2D)end {
    return  [[CLLocation alloc] initWithLatitude:(start.latitude + end.latitude)/2
                                       longitude:(start.longitude + end.longitude)/2];
    
}

- (CLLocationDistance)distanceBetweenStart:(CLLocation *)start
                                       end:(CLLocation *)end {
    return [end distanceFromLocation:start];
}
@end
