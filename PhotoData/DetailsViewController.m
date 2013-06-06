//
//  DetailsViewController.h
//  objc.io example project (issue #1)
//

#import "DetailsViewController.h"
#import "Photo.h"
#import "RatingCell.h"


static NSString *const DetailCellIdentifier = @"DetailCell";
static NSString *const RatingCellIdentifier = @"RatingCell";

static NSString *const PhotoIdentifierKey = @"identifier";
static NSString *const PhotoRatingKey = @"adjustedRating";
static NSString *const PhotoCreationDateKey = @"creationDate";


@interface DetailsViewController () <UITableViewDataSource, UITableViewDelegate>
@end


@implementation DetailsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupTableView];
}

- (void)setupTableView
{
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerNib:[RatingCell nib] forCellReuseIdentifier:RatingCellIdentifier];
}

- (NSArray *)keys
{
    return @[PhotoRatingKey, PhotoIdentifierKey, PhotoCreationDateKey];
}


#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.keys.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *key = self.keys[(NSUInteger) indexPath.row];
    id value = [self.photo valueForKey:key];
    UITableViewCell *cell;
    if ([key isEqual:PhotoRatingKey]) {
        cell = [self cellForRating:value indexPath:indexPath];
    } else {
        cell = [self detailCellForKey:key value:value];
    }
    return cell;
}

- (RatingCell *)cellForRating:(NSNumber *)rating indexPath:(NSIndexPath *)indexPath
{
    RatingCell *cell = [self.tableView dequeueReusableCellWithIdentifier:RatingCellIdentifier
                                                            forIndexPath:indexPath];
    cell.rating = rating.doubleValue;
    return cell;
}

- (UITableViewCell *)detailCellForKey:(NSString *)key value:(id)value
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:DetailCellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2
                                      reuseIdentifier:DetailCellIdentifier];
    }
    cell.textLabel.text = key;
    cell.detailTextLabel.text = [value description];
    return cell;
}


#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *key = self.keys[(NSUInteger) indexPath.row];
    [self.delegate didSelectPhotoAttributeWithKey:key];
}

@end
