#import "SCSSpaceship.h"

@implementation SCSSpaceship {
    double _altitude;
}
- (void)orbitPlanet:(SCSPlanet *)planet
         atAltitude:(double)altitude {
    _planetToOrbit = planet;
    _altitude = altitude;
}
- (void)engage {}
@end
