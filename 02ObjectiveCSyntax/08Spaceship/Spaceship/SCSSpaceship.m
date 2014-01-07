#import "SCSSpaceship.h"

@interface SCSSpaceship ()
@property (nonatomic) double altitude;
@property (strong, nonatomic, readwrite) SCSPlanet *planetToOrbit;
@end

@implementation SCSSpaceship
- (void)orbitPlanet:(SCSPlanet *)planet
         atAltitude:(double)altitude {
    self.planetToOrbit = planet;
    self.altitude = altitude;
}
- (void)engage {}
@end
