#import <XCTest/XCTest.h>
#import "SCSPlayingCard.h"

@interface SCSPlayingCardTests : XCTestCase
@property (nonatomic) SCSPlayingCard *playingCard;
@end

@implementation SCSPlayingCardTests

- (void)setUp {
    [super setUp];
    self.playingCard = [[SCSPlayingCard alloc] init];
}

- (void)tearDown {
    [super tearDown];
    self.playingCard = nil;
}
- (void)testPlayingCardExists {
    XCTAssertNotNil(self.playingCard, @"The playing card should exist.");
}

@end