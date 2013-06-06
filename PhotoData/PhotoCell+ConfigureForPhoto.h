//
//  PhotoCell+ConfigureForPhoto.h
//  objc.io example project (issue #1)
//


#import <Foundation/Foundation.h>
#import "PhotoCell.h"


@class Photo;


@interface PhotoCell (ConfigureForPhoto)

- (void)configureForPhoto:(Photo *)photo;

@end