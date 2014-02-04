#import <XCTest/XCTest.h>
#import "SCSDeck.h"
#import "SCSPlayingCard.h"

@interface SCSDeckTests : XCTestCase
@property (nonatomic) SCSDeck *deck;
@end


@implementation SCSDeckTests

- (void)setUp {
    [super setUp];
    self.deck = [[SCSDeck alloc] init];
}

- (void)tearDown {
    [super tearDown];
    self.deck = nil;
}

- (SCSPlayingCard *)aceOfClubs {
    return [[SCSPlayingCard alloc] initWithRank:@"A"
                                           suit:@"♣︎"
                                          color:[UIColor blackColor]];
}
- (SCSPlayingCard *)clubWithRank:(NSString *)rank {
    return [[SCSPlayingCard alloc] initWithRank:rank
                                           suit:@"♣︎"
                                          color:[UIColor blackColor]];
}

- (void)addFirstCardToDeck {
    [self.deck addCard:[self aceOfClubs]];
    
}

- (void)addTenCardsToDeck {
    [self addFirstCardToDeck];
    for (int i = 2; i < 11; i++) {
        [self.deck addCard:[self clubWithRank:[@(i) stringValue]]];
    }
}

- (void)testDeckExists {
    XCTAssertNotNil(self.deck, @"The deck should exist.");
}

- (void)testDeckType {
    XCTAssertEqualObjects([self.deck class], [SCSDeck class], @"Class should be SCSDeck.");
}

- (void)testNewDeckHasNoCards {
    XCTAssertEqual([self.deck numberOfCardsInDeck], 0, @"New deck should be empty.");
}
- (void)testCanAddAceOfClubs {
    [self addFirstCardToDeck];
        XCTAssertEqual([self.deck numberOfCardsInDeck], 1, @"Deck should have one card.");
    SCSPlayingCard *nextCard = [self.deck showNextCard];
            XCTAssertEqual([self.deck numberOfCardsInDeck], 1, @"Deck should have still have one card - ie nextCard doesn't remove a card.");
    SCSPlayingCard *aceOfClubs = [self aceOfClubs];
    XCTAssertEqualObjects(nextCard.rank, aceOfClubs.rank, @"Next card should be an ace.");
    XCTAssertEqualObjects(nextCard.suit, aceOfClubs.suit, @"Next card should be a club.");
    XCTAssertEqualObjects(nextCard.color, aceOfClubs.color, @"Next card should be black.");
}
- (void)testCanRemoveAddedCard {
    [self addFirstCardToDeck];
    SCSPlayingCard *dealtCard = [self.deck dealNextCard];
    XCTAssertEqual([self.deck numberOfCardsInDeck], 0, @"Deck should have no cards - ie dealNextCard removes a card.");
    SCSPlayingCard *aceOfClubs = [self aceOfClubs];
    XCTAssertEqualObjects(dealtCard.rank, aceOfClubs.rank, @"Next card should be an ace.");
    XCTAssertEqualObjects(dealtCard.suit, aceOfClubs.suit, @"Next card should be a club.");
    XCTAssertEqualObjects(dealtCard.color, aceOfClubs.color, @"Next card should be black.");
}
- (void)testShuffle {
    [self addTenCardsToDeck];
    [self.deck shuffleDeck];
    NSUInteger numberOfMatches = 0;
    if ([[self.deck dealNextCard].rank isEqualToString:@"A"]) {
        numberOfMatches++;
    }
    for (int i = 2; i < 11; i++) {
        if ([[self.deck dealNextCard].rank isEqualToString:[@(i) stringValue]]) {
            numberOfMatches++;
        }
    }
    XCTAssert(numberOfMatches < 5,@"should have fewer than five matches (yes this is an arbitrary number).");
}
@end
