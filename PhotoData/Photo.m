//
//  Photo.m
//  objc.io example project (edition #1)
//

#import "Photo.h"
#import "User.h"


static NSString * const IdentifierKey = @"identifier";
static NSString * const NameKey = @"name";
static NSString * const CreationDateKey = @"creationDate";
static NSString * const RatingKey = @"rating";
static NSString * const UserKey = @"user";


@implementation Photo

- (NSString*)description
{
    return [NSString stringWithFormat:@"<%@: %p> (%lld) \"%@\"",
            [self class], self, (long long) self.identifier, self.name];
}

- (void)encodeWithCoder:(NSCoder*)coder
{
    [coder encodeInt64:self.identifier forKey:IdentifierKey];
    [coder encodeObject:self.name forKey:NameKey];
    [coder encodeObject:self.creationDate forKey:CreationDateKey];
    [coder encodeDouble:self.rating forKey:RatingKey];
    [coder encodeConditionalObject:self.user forKey:UserKey];
}

- (BOOL)requiresSecureCoding
{
    return YES;
}

- (id)initWithCoder:(NSCoder*)coder
{
    self = [super init];
    if (self) {
        self.identifier = [coder decodeInt64ForKey:IdentifierKey];
        self.name = [coder decodeObjectOfClass:[NSString class] forKey:NameKey];
        self.creationDate = [coder decodeObjectOfClass:[NSDate class] forKey:CreationDateKey];
        self.rating = [coder decodeDoubleForKey:RatingKey];
        self.user = [coder decodeObjectOfClass:[User class] forKey:UserKey];
    }
    return self;
}

- (NSString*)authorFullName
{
    return self.user.fullName;
}

- (double)adjustedRating
{
    double adjustedRating = (self.rating - 97) / 3.0;
    if (adjustedRating < 0) {
        adjustedRating = 0;
    }
    return adjustedRating;
}

@end
