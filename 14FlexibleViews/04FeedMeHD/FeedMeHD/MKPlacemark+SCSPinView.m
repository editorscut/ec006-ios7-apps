#import "MKPlacemark+SCSPinView.h"
@import AddressBookUI;

@implementation MKPlacemark (SCSPinView)
- (NSString *)title {
    return self.name;
}
- (NSString *)subtitle {
    return ABCreateStringWithAddressDictionary(self.addressDictionary, NO);
}
@end