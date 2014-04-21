//
//  ArchiveReadingTests.m
//  objc.io example project (issue #1)
//

#import "PhotoDataTestCase.h"

#import "Store.h"
#import "Photo.h"
#import "User.h"



@interface ArchiveReadingTests : PhotoDataTestCase
@end



@implementation ArchiveReadingTests

- (void)testCreatingStore
{
    Store* store = [Store store];
    XCTAssertNotNil(store, @"");
    XCTAssertNotNil(store.photos, @"");
    XCTAssertNotNil(store.users, @"");
}

- (void)testPhotos
{
    Store* store = [Store store];
    for (Photo *photo in store.photos) {
        XCTAssertTrue(0 != photo.identifier, @"All photos must have an identifier");
        XCTAssertNotNil(photo.user, @"All photos must have a user");
    }
    
    XCTAssertTrue(0 < [[store.photos filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(Photo *photo, NSDictionary *bindings) {
        return (0 < [photo.name length]);
    }]] count], @"At leat 1 photo must have a name");
}

- (void)testUsers
{
    Store* store = [Store store];
    for (User *user in store.users) {
        XCTAssertTrue(0 != user.identifier, @"All users must have an identifier");
        XCTAssertTrue(0 < [user.username length], @"All users must have a username");
        XCTAssertTrue(0 < [user.photos count], @"All users must have at least 1 photo");
    }
    
    XCTAssertTrue(0 < [[store.users filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(User *user, NSDictionary *bindings) {
        return (0 < [user.firstName length]);
    }]] count], @"At leat 1 user must have a first name");
    XCTAssertTrue(0 < [[store.users filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(User *user, NSDictionary *bindings) {
        return (0 < [user.lastName length]);
    }]] count], @"At leat 1 user must have a last name");
}

@end
