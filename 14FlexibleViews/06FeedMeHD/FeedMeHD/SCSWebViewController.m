#import "SCSWebViewController.h"

@interface SCSWebViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@end

@implementation SCSWebViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = [self.url host];
    [self.webView loadRequest:[NSURLRequest requestWithURL:self.url]];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.spinner stopAnimating];
}
@end
