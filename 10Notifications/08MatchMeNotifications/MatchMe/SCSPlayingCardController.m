#import "SCSPlayingCardController.h"
#import "SCSPlayingCard.h"
#import "SCSPlayingCardCell.h"
#import "SCSConstants.h"

@interface SCSPlayingCardController ()<SCSPlayingCardCellDataSource>
@property (nonatomic) SCSPlayingCard *playingCard;
@property (nonatomic) SCSPlayingCardCell *cell;
@property (nonatomic) id didMatchToken;
@property (nonatomic) id didNotMatchToken;
@end

@implementation SCSPlayingCardController

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self.didMatchToken];
    [[NSNotificationCenter defaultCenter] removeObserver:self.didNotMatchToken];
}

- (void)registerForDidIdentifyMatchingCardsNotification {
    self.didMatchToken = [[NSNotificationCenter defaultCenter] addObserverForName:SCSMatchMeGameDidIdentifyMatchingCardsNotification
                                                                           object:nil
                                                                            queue:[NSOperationQueue mainQueue]
                                                                       usingBlock:^(NSNotification *notification) {
                                                                           if ([self.playingCard isFaceUp]) {
                                                                               [UIView animateWithDuration:1.0
                                                                                                animations:^{
                                                                                                    self.cell.alpha = 0;
                                                                                                }];
                                                                           }
                                                                       }];
}
- (void)registerForDidIdentifyNonmatchingCardsNotification {
    self.didNotMatchToken = [[NSNotificationCenter defaultCenter] addObserverForName:SCSMatchMeGameDidIdentifyNonmatchingCardsNotification
                                                                              object:nil
                                                                               queue:[NSOperationQueue mainQueue]
                                                                          usingBlock:^(NSNotification *notification) {
                                                                              if ([self.playingCard isFaceUp]) {
                                                                                  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                                                                      [self.playingCard hideCardFace];
                                                                                  });
                                                                              }
                                                                            
                                                                          }];
    
}

- (instancetype)initWithPlayingCard:(SCSPlayingCard *)playingCard {
    self = [super init];
    if (self) {
        _playingCard = playingCard;
        [self registerForDidIdentifyMatchingCardsNotification];
        [self registerForDidIdentifyNonmatchingCardsNotification];
    }
    return self;
}
- (instancetype)init {
    return [self initWithPlayingCard:nil];
}
- (void)connectToCell:(UICollectionViewCell *)cell {
    if ([cell isKindOfClass:[SCSPlayingCardCell class]]) {
        self.cell = (SCSPlayingCardCell *)cell;
        self.cell.dataSource = self;
        [self.cell refreshView];
        [self.playingCard addObserver:self.cell
                           forKeyPath:@"isFaceUp"
                              options:NSKeyValueObservingOptionNew
                              context:NULL];
    }
}

- (void)didTapCell {
    if (self.playingCard.isFaceUp) {
        [self.playingCard hideCardFace];
    } else {
        [self.playingCard showCardFace];
    }
}
- (NSString *)contentStringForPlayingCardCell:(SCSPlayingCardCell *)playingCardCell {
    return [NSString stringWithFormat:@"%@ %@", self.playingCard.rank, self.playingCard.suit];
}

- (UIColor *)colorForPlayingCardCell:(SCSPlayingCardCell *)playingCardCell {
    return self.playingCard.color;
}

- (UIImageView *)imageViewForBackOfPlayingCardCell:(SCSPlayingCardCell *)playingCardCell {
    UIImage *backOfCardImage = [UIImage imageNamed:@"stanford"];
    return [[UIImageView alloc] initWithImage:backOfCardImage];
}

@end
