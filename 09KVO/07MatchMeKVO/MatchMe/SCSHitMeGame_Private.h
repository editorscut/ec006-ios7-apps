#import "SCSHitMeGame.h"
@class SCSDeck;

@interface SCSHitMeGame ()
@property (nonatomic) NSArray *validRanks;
@property (nonatomic) NSArray *validSuits;
@property (nonatomic) NSDictionary *colorForSuit;
@property (nonatomic) SCSDeck *deck;
@end