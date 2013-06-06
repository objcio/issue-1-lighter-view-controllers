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
    STAssertNotNil(store, @"");
    STAssertNotNil(store.photos, @"");
    STAssertNotNil(store.users, @"");
}

- (void)testPhotos
{
    Store* store = [Store store];
    for (Photo *photo in store.photos) {
        STAssertTrue(0 != photo.identifier, @"All photos must have an identifier");
        STAssertNotNil(photo.user, @"All photos must have a user");
    }
    
    STAssertTrue(0 < [[store.photos filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(Photo *photo, NSDictionary *bindings) {
        return (0 < [photo.name length]);
    }]] count], @"At leat 1 photo must have a name");
}

- (void)testUsers
{
    Store* store = [Store store];
    for (User *user in store.users) {
        STAssertTrue(0 != user.identifier, @"All users must have an identifier");
        STAssertTrue(0 < [user.username length], @"All users must have a username");
        STAssertTrue(0 < [user.photos count], @"All users must have at least 1 photo");
    }
    
    STAssertTrue(0 < [[store.users filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(User *user, NSDictionary *bindings) {
        return (0 < [user.firstName length]);
    }]] count], @"At leat 1 user must have a first name");
    STAssertTrue(0 < [[store.users filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(User *user, NSDictionary *bindings) {
        return (0 < [user.lastName length]);
    }]] count], @"At leat 1 user must have a last name");
}

@end
