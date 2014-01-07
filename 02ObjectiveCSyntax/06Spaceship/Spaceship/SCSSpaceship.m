#import "SCSSpaceship.h"

@implementation SCSSpaceship {
    double _altitude;
}
- (SCSPlanet *)planetToOrbit {
    return _planetToOrbit;
}
- (double)topSpeed {
    return _topSpeed;
}
- (void)setTopSpeed:(double)topSpeed {
    _topSpeed = topSpeed;
}
- (void)orbitPlanet:(SCSPlanet *)planet
         atAltitude:(double)altitude {
    _planetToOrbit = planet;
    _altitude = altitude;
}
- (void)engage {}
@end
