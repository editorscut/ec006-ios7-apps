#import <XCTest/XCTest.h>
#import "SCSHitMeGame.h"
#import "SCSPlayingCard.h"

@interface SCSHitMeGameTests : XCTestCase
@property (nonatomic) SCSHitMeGame *game;
@end

@interface SCSHitMeGame (Testing)
- (void)fillDeck;
@end

@implementation SCSHitMeGameTests

- (void)setUp {
    [super setUp];
    self.game = [[SCSHitMeGame alloc] init];
    [self.game fillDeck];
}

- (void)tearDown {
    [super tearDown];
    self.game = nil;
}
- (void)testGameExists {
    XCTAssertNotNil(self.game, @"The game should exist.");
}

- (void)testGameType {
    XCTAssertEqualObjects([self.game class], [SCSHitMeGame class], @"Class should be SCSHitMeGame.");
}

- (void)testNewGames {
    SCSPlayingCard *firstCard = [self.game nextCard];
    XCTAssertNotNil(firstCard, @"There should be a first card");
    XCTAssertEqualObjects(firstCard.rank, @"A", @"The first card is an ace");
    XCTAssertEqualObjects(firstCard.suit, @"♣︎", @"The first card is a club");
    for (int i = 1; i < 51; i++) {
        [self.game nextCard];
    }
    SCSPlayingCard *lastCard = [self.game nextCard];
    XCTAssertNotNil(lastCard, @"There should be a first card");
    XCTAssertEqualObjects(lastCard.rank, @"K", @"The first card is an ace");
    XCTAssertEqualObjects(lastCard.suit, @"♦︎", @"The first card is a club");
}


@end
