//
//  PhotoCellTests.m
//  objc.io example project (issue #1)
//

#import "PhotoDataTestCase.h"

#import "PhotoCell.h"



@interface PhotoCellTests : PhotoDataTestCase
@end



@implementation PhotoCellTests

- (void)testNibLoading
{
    UINib *nib = [PhotoCell nib];
    STAssertNotNil(nib, @"");
    
    NSArray *a = [nib instantiateWithOwner:nil options:@{}];
    STAssertEquals([a count], (NSUInteger) 1, @"");
    PhotoCell *cell = a[0];
    STAssertTrue([cell isMemberOfClass:[PhotoCell class]], @"");
    
    // Check that outlets are set up correctly:
    STAssertNotNil(cell.photoTitleLabel, @"");
    STAssertNotNil(cell.photoDateLabel, @"");
}

@end
