//
//  RatingCell.h
//  objc.io example project (issue #1)
//


#import <Foundation/Foundation.h>


@interface RatingCell : UITableViewCell

@property (nonatomic) double rating; // 0 to 1

+ (UINib *)nib;

@end