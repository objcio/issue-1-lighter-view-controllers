//
//  PhotoDataTestCase.m
//  objc.io example project (issue #1)
//

#import "PhotoDataTestCase.h"



@interface PhotoDataTestCase ()

@property (nonatomic, strong) NSMutableArray *mocksToVerify;

@end



@implementation PhotoDataTestCase

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    for (id mock in self.mocksToVerify) {
        [mock verify];
    }
    self.mocksToVerify = nil;
    [super tearDown];
}

- (NSURL *)URLForResource:(NSString *)name withExtension:(NSString *)extension
{
    NSBundle *bundle = [NSBundle bundleForClass:[PhotoDataTestCase class]];
    return [bundle URLForResource:name withExtension:extension];
}

- (id)autoVerifiedMockForClass:(Class)aClass
{
    id mock = [OCMockObject mockForClass:aClass];
    [self verifyDuringTearDown:mock];
    return mock;
}

- (id)autoVerifiedPartialMockForObject:(id)object
{
    id mock = [OCMockObject partialMockForObject:object];
    [self verifyDuringTearDown:mock];
    return mock;
}

- (void)verifyDuringTearDown:(id)mock
{
    if (self.mocksToVerify == nil) {
        self.mocksToVerify = [NSMutableArray array];
    }
    [self.mocksToVerify addObject:mock];
}

@end
