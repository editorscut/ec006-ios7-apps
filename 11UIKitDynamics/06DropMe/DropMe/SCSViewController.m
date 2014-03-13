#import "SCSViewController.h"

static const CGFloat  SQUARE_SIZE = 40;
static const NSUInteger NUMBER_OF_COLUMNS = 8;

@interface SCSViewController ()<UICollisionBehaviorDelegate>
@property (nonatomic) NSArray *colors;
@property (nonatomic) UIDynamicAnimator *animator;
@property (nonatomic) UIGravityBehavior *gravity;
@property (nonatomic) UICollisionBehavior *collision;
@property (nonatomic) UIDynamicItemBehavior *itemBehavior;
@property (nonatomic) NSMutableSet *bottomRow;
@end

@implementation SCSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    self.bottomRow = [[NSMutableSet alloc] initWithCapacity:NUMBER_OF_COLUMNS];
}
#pragma mark - behavior
- (UIGravityBehavior *)gravity {
    if (!_gravity) {
        _gravity = [[UIGravityBehavior alloc] init];
        _gravity.magnitude = 0.9;
        [self.animator addBehavior:_gravity];
    }
    return _gravity;
}
- (UICollisionBehavior *)collision {
    if (!_collision) {
        _collision = [[UICollisionBehavior alloc] init];
        _collision.translatesReferenceBoundsIntoBoundary = YES;
        _collision.collisionDelegate = self;
        [self. animator addBehavior:_collision];
    }
    return _collision;
}
- (UIDynamicItemBehavior *)itemBehavior {
    if (!_itemBehavior) {
        _itemBehavior = [[UIDynamicItemBehavior alloc] init];
        _itemBehavior.allowsRotation = NO;
        _itemBehavior.elasticity = .5;
        [self.animator addBehavior:_itemBehavior];
    }
    return _itemBehavior;
}
- (void)addBehaviorForBox:(UIView *)box {
    [self.gravity addItem:box];
    [self.collision addItem:box];
    [self.itemBehavior addItem:box];
}
#pragma mark - box creation
- (IBAction)tapToAddBox:(UITapGestureRecognizer *)sender {
    [self createBox];
}
- (void)createBox {
    UIView *nextBox = [[UIView alloc] initWithFrame:[self randomInitialPosition]];
    nextBox.backgroundColor = [self randomColor];
    [self.view addSubview:nextBox];
    [self addBehaviorForBox:nextBox];
}
#pragma mark - row removal
- (BOOL)didCollideWithBottom:(CGFloat)yValue {
    CGFloat distanceFromBottom = self.view.frame.size.height - yValue;
    return (distanceFromBottom < SQUARE_SIZE);
}
- (void)collisionBehavior:(UICollisionBehavior *)behavior
      beganContactForItem:(id<UIDynamicItem>)item
   withBoundaryIdentifier:(id<NSCopying>)identifier
                  atPoint:(CGPoint)point {
    if ([self didCollideWithBottom:point.y]) {
        [self.bottomRow addObject:item];
    }
}
#pragma mark - box configuration

- (CGRect)randomInitialPosition {
    CGFloat column = arc4random_uniform(NUMBER_OF_COLUMNS);
    return CGRectMake(column * SQUARE_SIZE, SQUARE_SIZE, SQUARE_SIZE, SQUARE_SIZE);
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
