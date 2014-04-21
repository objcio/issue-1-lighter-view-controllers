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
    XCTAssertNotNil(nib, @"");
    
    NSArray *a = [nib instantiateWithOwner:nil options:@{}];
    XCTAssertEqual([a count], (NSUInteger) 1, @"");
    PhotoCell *cell = a[0];
    XCTAssertTrue([cell isMemberOfClass:[PhotoCell class]], @"");
    
    // Check that outlets are set up correctly:
    XCTAssertNotNil(cell.photoTitleLabel, @"");
    XCTAssertNotNil(cell.photoDateLabel, @"");
}

@end
