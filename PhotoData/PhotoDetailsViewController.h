//
//  PhotoDetailsViewController.h
//  objc.io example project (edition #1)
//

#import <UIKit/UIKit.h>


@class Photo;


@protocol PhotoDetailsViewControllerDelegate

- (void)didSelectPhotoAttributeWithKey:(NSString *)key;

@end


@interface PhotoDetailsViewController : UITableViewController

@property (nonatomic, strong) Photo *photo;
@property (nonatomic, weak) id <PhotoDetailsViewControllerDelegate> delegate;

@end
