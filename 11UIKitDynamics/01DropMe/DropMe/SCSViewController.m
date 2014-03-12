#import "SCSViewController.h"

static const CGFloat  SQUARE_SIZE = 40;
static const NSUInteger NUMBER_OF_COLUMNS = 8;
static const NSUInteger NUMBER_OF_ROWS = 10;

@interface SCSViewController ()
@property (nonatomic) NSArray *colors;
@end

@implementation SCSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - box creation
- (IBAction)tapToAddBox:(UITapGestureRecognizer *)sender {
    [self createBox];
}
- (void)createBox {
    UIView *nextBox = [[UIView alloc] initWithFrame:[self randomInitialPosition]];
    nextBox.backgroundColor = [self randomColor];
    [self.view addSubview:nextBox];
}
#pragma mark - box configuration

- (CGRect)randomInitialPosition {
    CGFloat column = arc4random_uniform(NUMBER_OF_COLUMNS);
    CGFloat row = arc4random_uniform(NUMBER_OF_ROWS);
    return CGRectMake(column * SQUARE_SIZE, (row + 1) * SQUARE_SIZE, SQUARE_SIZE, SQUARE_SIZE);
}
- (UIColor *)randomColor {
    return self.colors[arc4random_uniform([self.colors count])];
}

- (NSArray *)colors {
    if ( ! _colors) {
        _colors = @[[UIColor redColor], [UIColor blueColor], [UIColor greenColor], [UIColor yellowColor], [UIColor magentaColor], [UIColor orangeColor], [UIColor whiteColor]];
    }
    return _colors;
}

@end
