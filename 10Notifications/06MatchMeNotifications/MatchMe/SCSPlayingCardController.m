#import "SCSPlayingCardController.h"
#import "SCSPlayingCard.h"
#import "SCSPlayingCardCell.h"

@interface SCSPlayingCardController ()<SCSPlayingCardCellDataSource>
@property (nonatomic) SCSPlayingCard *playingCard;
@property (nonatomic) SCSPlayingCardCell *cell;
@end

@implementation SCSPlayingCardController

- (instancetype)initWithPlayingCard:(SCSPlayingCard *)playingCard {
    self = [super init];
    if (self) {
        _playingCard = playingCard;
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
