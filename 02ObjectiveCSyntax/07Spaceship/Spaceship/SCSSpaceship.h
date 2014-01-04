@import Foundation;
#import "SCSPlanet.h"

@interface SCSSpaceship : NSObject
@property (strong, nonatomic, readonly) SCSPlanet *planetToOrbit;
@property (assign, nonatomic) double topSpeed;
- (void)engage;
- (void)orbitPlanet:(SCSPlanet *)planet
         atAltitude:(double)altitude;
@end
