//
//  DetailsViewController.h
//  objc.io example project (issue #1)
//

#import <UIKit/UIKit.h>


@class Photo;


@protocol DetailsViewControllerDelegate

- (void)didSelectPhotoAttributeWithKey:(NSString *)key;

@end


@interface DetailsViewController : UITableViewController

@property (nonatomic, strong) Photo *photo;
@property (nonatomic, weak) id <DetailsViewControllerDelegate> delegate;

@end
