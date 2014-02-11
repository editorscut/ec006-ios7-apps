#import "SCSMatchMeGame.h"

@interface SCSMatchMeGame ()
@property (nonatomic) NSInteger pairs;
@end

@implementation SCSMatchMeGame
- (instancetype)initWithPairs:(NSInteger)pairs {
    self = [super init];
    if (self) {
        _pairs = pairs;
    }
    return self;
}
- (instancetype)init {
    return [self initWithPairs:0];
}
@end
