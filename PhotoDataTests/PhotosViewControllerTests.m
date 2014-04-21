//
//  PhotosViewControllerTests.m
//  objc.io example project (issue #1)
//

#import "PhotoDataTestCase.h"
#import "PhotosViewController.h"
#import "PhotoViewController.h"
#import "AppDelegate.h"


@interface PhotosViewControllerTests : PhotoDataTestCase
@end



@implementation PhotosViewControllerTests

- (void)testNibLoading
{
    UINavigationController *nav = [[UINavigationController alloc] init];
    id navMock = [self autoVerifiedPartialMockForObject:nav];
    
    // Create an instance that has the given navigation controller mock:
    PhotosViewController *photosViewController = [[PhotosViewController alloc] initWithNibName:@"PhotosViewController" bundle:nil];
    id photosViewControllerMock = [self autoVerifiedPartialMockForObject:photosViewController];
    [[[photosViewControllerMock stub] andReturn:nav] navigationController];

    
    // We expect a PhotoViewController instance to be pushed onto the nav controller:
    [[navMock expect] pushViewController:[OCMArg checkWithBlock:^BOOL(id obj) {
        PhotoViewController *vc = obj;
        return ([vc isKindOfClass:[PhotoViewController class]] &&
                (vc.photo != nil));
    }] animated:YES];
    
    // Trigger view did load:
    UIView *view = photosViewController.view;
    NSLog(@"view is: %@", view);
    XCTAssertNotNil(view, @"view should not be nit");
    // Simulate a tap on the row:
    [photosViewController tableView:photosViewController.tableView didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
}

@end
