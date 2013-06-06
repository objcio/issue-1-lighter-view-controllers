//
//  AppDelegate.h
//  objc.io example project (issue #1)
//

#import <UIKit/UIKit.h>


@class Store;


@interface AppDelegate : UIResponder <UIApplicationDelegate>

+ (instancetype)sharedDelegate;

@property (strong, nonatomic) UIWindow *window;
@property (readonly, strong, nonatomic) Store *store;

@end
