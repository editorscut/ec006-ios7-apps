#import "SCSSpaceship.h"

@interface SCSSpaceship ()
@property (nonatomic) double altitude;
@end

@implementation SCSSpaceship
- (void)orbitPlanet:(SCSPlanet *)planet
         atAltitude:(double)altitude {
    _planetToOrbit = planet;
    _altitude = altitude;
}
- (void)engage {}
@end
