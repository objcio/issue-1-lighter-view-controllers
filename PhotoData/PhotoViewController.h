//
//  PhotoViewController.h
//  objc.io example project (edition #1)
//


#import <Foundation/Foundation.h>


@class Photo;


@interface PhotoViewController : UIViewController

@property (nonatomic, strong) Photo *photo;

@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *photosTakenLabel;

@end