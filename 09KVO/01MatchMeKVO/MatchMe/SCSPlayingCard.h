#import <Foundation/Foundation.h>

@interface SCSPlayingCard : NSObject
@property (nonatomic, readonly) NSString *rank;
@property (nonatomic, readonly) NSString *suit;
@property (nonatomic, readonly) UIColor *color;
- (instancetype)initWithRank:(NSString *)rank
                        suit:(NSString *)suit
                       color:(UIColor *)color;
@end
