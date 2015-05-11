//
//  DetailViewController.m
//  objc.io example project (issue #1)
//


#import "DetailViewController.h"


@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = self.key;
}

@end
