#import "SCSPlayingCardController.h"
#import "SCSPlayingCard.h"
#import "SCSPlayingCardCell.h"

@interface SCSPlayingCardController ()<SCSPlayingCardCellDataSource>
@property (nonatomic) SCSPlayingCard *playingCard;
@end

@implementation SCSPlayingCardController

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
