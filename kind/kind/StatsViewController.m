//
//  StatsViewController.m
//  kind
//
//  Created by Caroline Wong on 7/10/14.
//  Copyright (c) 2014 madebycaro. All rights reserved.
//

#import "StatsViewController.h"
#import <Parse/Parse.h>
@interface StatsViewController ()

@end

@implementation StatsViewController
@synthesize personalTitleLabel, personalCount15, personalMonthTitleLabel, personalMonthCount, personalTotalLabel, personalTotalCount, commTitle, commDailyTitleLabel, commDailyCount, commMonthCount, commMonthTitleLabel, commTotalCount, commTotalTitleLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor darkGrayColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //title labels
    personalTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, 100, 30)];
    [personalTitleLabel setText:@"Personal"];
    
    personalMonthTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 80, 100, 30)];
    [personalMonthTitleLabel setText:@"Monthly:"];
    personalTotalLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 120, 100, 30)];
    [personalTotalLabel setText:@"Total:"];
    
    commTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 280, 100, 30)];
    [commTitle setText:@"Community"];
    commMonthTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 280, 100, 30)];
    [commMonthTitleLabel setText:@"Monthly:"];
    commTotalTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 320, 100, 30)];
    [commTotalTitleLabel setText:@"Total:"];
    
    //count labels
    personalCount15 = [[UILabel alloc] initWithFrame:CGRectMake(10, 120, 100, 30)];
    personalMonthCount = [[UILabel alloc] initWithFrame:CGRectMake(270, 80, 60, 30)];
    personalTotalCount = [[UILabel alloc] initWithFrame:CGRectMake(270, 120, 60, 30)];
    commMonthCount = [[UILabel alloc] initWithFrame:CGRectMake(270, 280, 60, 30)];
    commTotalCount = [[UILabel alloc] initWithFrame:CGRectMake(270, 320, 60, 30)];
    
    [self.view addSubview:personalTitleLabel];
    [self.view addSubview:personalMonthTitleLabel];
    [self.view addSubview:personalTotalLabel];
    [self.view addSubview:commMonthTitleLabel];
    [self.view addSubview:commTitle];
    [self.view addSubview:commTotalTitleLabel];
    [self.view addSubview:personalCount15];
    [self.view addSubview:personalMonthCount];
    [self.view addSubview:personalTotalCount];
    [self.view addSubview:commMonthCount];
    [self.view addSubview:commTotalCount];
    
   [self queryForPersMonth];
   // [self queryForPersTotal];
    
    [self queryForCommunityTotal];
    
    // Do any additional setup after loading the view.
}

-(void) queryForPersMonth {
    PFQuery* query = [PFQuery queryWithClassName:@"Deed"];
    query.cachePolicy = kPFCachePolicyCacheThenNetwork;
    NSTimeInterval secInMonth = 30*24*60*60;
    NSDate* month = [NSDate dateWithTimeInterval:-secInMonth sinceDate:[NSDate date]];
    [query whereKey:@"createdAt" lessThan: month];
     [query whereKey:@"createdBy" equalTo:[PFUser currentUser]];
    NSLog(@"last week %@", month);
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            [personalMonthCount setText:[NSString stringWithFormat:@"%d",(int)[objects count]]];
        } else {
            NSLog(@"Error %@", error);
        }
    }];
}
-(void) queryForPersTotal {
    PFQuery* query = [PFQuery queryWithClassName:@"Deed"];
    query.cachePolicy = kPFCachePolicyCacheThenNetwork;
    [query whereKey:@"createdBy" equalTo:[PFUser currentUser]];
    [query countObjectsInBackgroundWithBlock:^(int number, NSError *error) {
        if (!error) {
            NSLog(@"the number is: %d", number);
          //,  [personalTotalCount setText:[NSString stringWithFormat:@"%d",number]];
        } else {
            NSLog(@"Error %@", error);
        }
    }];
}
-(void) queryForCommunityTotal {
    PFQuery* query = [PFQuery queryWithClassName:@"Deed"];
    query.cachePolicy = kPFCachePolicyCacheThenNetwork;
    [query countObjectsInBackgroundWithBlock:^(int number, NSError *error) {
        if (!error) {
             [commTotalCount setText:[NSString stringWithFormat:@"%d", number]];
        } else {
            NSLog(@"error, %@", error);
        }
    }];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
*/
 
 @end