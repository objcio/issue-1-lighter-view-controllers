//
//  Store.m
//  objc.io example project (edition #1)
//

#import "Store.h"
#import "Photo.h"


@implementation Store

+ (instancetype)store
{
    return [[self alloc] init];
}

- (id)init
{
    self = [super init];
    if (self) {
        [self readArchive];
    }
    return self;
}

- (void)readArchive
{
    NSURL *archiveURL = [[NSBundle bundleForClass:[self class]] URLForResource:@"photodata" withExtension:@"bin"];
    NSAssert(archiveURL != nil, @"Unable to find archive in bundle.");
    NSData *data = [NSData dataWithContentsOfURL:archiveURL options:0 error:NULL];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    _users = [unarchiver decodeObjectOfClass:[NSArray class] forKey:@"users"];
    _photos = [unarchiver decodeObjectOfClass:[NSArray class] forKey:@"photos"];
    [unarchiver finishDecoding];
}

- (NSArray *)sortedPhotos
{
    return [self.photos sortedArrayUsingComparator:^NSComparisonResult(Photo *photo1, Photo *photo2) {
        return [photo2.creationDate compare:photo1.creationDate];
    }];
}

@end
