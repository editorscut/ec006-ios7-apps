#import "SCSMissionControl.h"

@implementation SCSMissionControl

- (void)beginMission {
    [self.spaceship engage];
}
- (void)createSpaceship {
    self.spaceship = [[SCSSpaceship alloc] init];
}

- (void)designMission {
    SCSPlanet *planet = [[SCSPlanet alloc] initWithName:@"Mars"];
    [self.spaceship orbitPlanet:planet
                     atAltitude:2000];
}
- (void)runMission {
    [self createSpaceship];
    [self designMission];
    [self beginMission];
}
@end
