//
//  AppDelegate.m
//  objc.io example project (issue #1)
//

#import "AppDelegate.h"
#import "PhotosViewController.h"
#import "Store.h"


static BOOL isRunningTests(void) __attribute__((const));


@implementation AppDelegate

+ (instancetype)sharedDelegate
{
    return [UIApplication sharedApplication].delegate;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    if (isRunningTests()) {
        return YES;
    }
    PhotosViewController *photosViewController = [[PhotosViewController alloc] initWithNibName:@"PhotosViewController"
                                                                                              bundle:nil];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:photosViewController];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setRootViewController:navigationController];
    [self.window makeKeyAndVisible];
    return YES;
}

@synthesize store = _store;

- (Store *)store
{
    if (_store == nil) {
        _store = [Store store];
    }
    return _store;
}

@end


static BOOL isRunningTests(void)
{
    return [[[[NSProcessInfo processInfo] environment][@"XCInjectBundle"] pathExtension] isEqualToString:@"octest"];
}
