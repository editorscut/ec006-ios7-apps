#import <XCTest/XCTest.h>
#import "SCSSetPlayingCard.h"

@interface SCSPlayingCardTests : XCTestCase
@property (nonatomic) SCSPlayingCard *playingCard;
@end

@implementation SCSPlayingCardTests

- (void)setUp {
    [super setUp];
    self.playingCard = [[SCSSetPlayingCard alloc] initWithRank:@"A"
                                                          suit:@"♣︎"
                                                         color:[UIColor blackColor]];
}

- (void)tearDown {
    [super tearDown];
    self.playingCard = nil;
}
- (void)testPlayingCardExists {
    XCTAssertNotNil(self.playingCard, @"The playing card should exist.");
}

- (void)testPlayingCardType {
    XCTAssertEqualObjects([self.playingCard class], [SCSPlayingCard class], @"Class should be SCSPlayingCard");
}

- (void)testCardIsAceOfClubs {
    XCTAssertEqualObjects(self.playingCard.rank, @"A", @"Rank should be A");
    XCTAssertEqualObjects(self.playingCard.suit, @"♣︎", @"Suit should be ♣︎");
    XCTAssertEqualObjects(self.playingCard.color, [UIColor blackColor], @"Color should be black");
}

@end