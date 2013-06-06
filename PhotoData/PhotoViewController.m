//
//  PhotoViewController.h
//  objc.io example project (edition #1)
//


#import "PhotoViewController.h"
#import "Photo.h"
#import "User.h"
#import "PhotoDetailsViewController.h"
#import "PhotoDetailViewController.h"


@interface PhotoViewController () <PhotoDetailsViewControllerDelegate>
@end


@implementation PhotoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateForPhoto];
    [self addPhotoDetailsTableView];
}

- (void)updateForPhoto
{
    self.navigationItem.title = self.photo.name;
    self.authorLabel.text = self.photo.authorFullName;
    self.photosTakenLabel.text = [NSString stringWithFormat:@"%d", self.photo.user.numberOfPhotosTaken];
}

- (void)addPhotoDetailsTableView
{
    PhotoDetailsViewController *photoDetails = [[PhotoDetailsViewController alloc] init];
    photoDetails.photo = self.photo;
    photoDetails.delegate = self;
    [self addChildViewController:photoDetails];
    CGRect frame = self.view.bounds;
    frame.origin.y = 110;
    photoDetails.view.frame = frame;
    [self.view addSubview:photoDetails.view];
    [photoDetails didMoveToParentViewController:self];
}


#pragma mark OBJPhotoDetailsViewControllerDelegate

- (void)didSelectPhotoAttributeWithKey:(NSString *)key
{
    PhotoDetailViewController *detailViewController = [[PhotoDetailViewController alloc] init];
    detailViewController.key = key;
    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end