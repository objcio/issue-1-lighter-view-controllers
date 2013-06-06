//
//  PhotoCell.h
//  objc.io example project (issue #1)
//

#import "PhotoCell.h"


@implementation PhotoCell

+ (UINib *)nib
{
    return [UINib nibWithNibName:@"PhotoCell" bundle:nil];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    if (highlighted) {
        self.photoTitleLabel.shadowColor = [UIColor darkGrayColor];
        self.photoTitleLabel.shadowOffset = CGSizeMake(3, 3);
    } else {
        self.photoTitleLabel.shadowColor = nil;
    }
}

@end
