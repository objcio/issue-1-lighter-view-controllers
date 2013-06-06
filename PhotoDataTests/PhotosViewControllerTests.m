//
//  PhotosViewControllerTests.m
//  objc.io example project (issue #1)
//

#import "PhotoDataTestCase.h"
#import "PhotosViewController.h"
#import "PhotoViewController.h"


@interface PhotosViewControllerTests : PhotoDataTestCase
@end



@implementation PhotosViewControllerTests

- (void)testNibLoading
{
    id mockNavController = [self autoVerifiedMockForClass:[UINavigationController class]];
    
    // Create an instance that has the given navigation controller mock:
    PhotosViewController *photosViewController = [[PhotosViewController alloc] init];
    id photosViewControllerMock = [self autoVerifiedPartialMockForObject:photosViewController];
    [[[photosViewControllerMock stub] andReturn:mockNavController] navigationController];
    
    // We expect a PhotoViewController instance to be pushed onto the nav controller:
    [[mockNavController expect] pushViewController:[OCMArg checkWithBlock:^BOOL(id obj) {
        PhotoViewController *vc = obj;
        return ([vc isKindOfClass:[PhotoViewController class]] &&
                (vc.photo != nil));
    }] animated:YES];
    
    // Trigger view did load:
    UIView *view = photosViewController.view;
    STAssertNotNil(view, @"");
    // Simulate a tap on the row:
    [photosViewController tableView:photosViewController.tableView didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
}

@end
