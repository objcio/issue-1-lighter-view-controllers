//
//  Store.h
//  objc.io example project (issue #1)
//

#import <Foundation/Foundation.h>


@interface Store : NSObject

+ (instancetype)store;

@property (readonly, nonatomic, strong) NSArray* photos;
@property (readonly, nonatomic, strong) NSArray* users;

- (NSArray*)sortedPhotos;

@end
