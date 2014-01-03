@import Foundation;
#import "SCSPlanet.h"

@interface SCSSpaceship : NSObject
- (SCSPlanet *)planetToOrbit;
- (double)topSpeed;
- (void)setTopSpeed:(double)topSpeed;
- (void)engage;
- (void)orbitPlanet:(SCSPlanet *)planet
         atAltitude:(double)altitude;
@end
