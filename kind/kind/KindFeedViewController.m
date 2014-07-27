//
//  KindFeedViewController.m
//  kind
//
//  Created by Caroline Wong on 7/10/14.
//  Copyright (c) 2014 madebycaro. All rights reserved.
//

#import "KindFeedViewController.h"
#import <Parse/Parse.h>

@interface KindFeedViewController ()

@end

@implementation KindFeedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        // self.view.backgroundColor = [UIColor purpleColor];
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated {
    [self query];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"asdf");
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height - self.navigationController.navigationBar.frame.size.height)];
    scrollView.delegate = self;
    scrollView.scrollEnabled = YES;
    
    // UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    scrollView.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1];
    // [scrollView addSubview:view];
    scrollView.contentSize = CGSizeMake(300, 5000);
    [self.view addSubview:scrollView];
    [self query];
    
    
}

-(void) query {
    
    PFQuery* query = [PFQuery queryWithClassName:@"Deed"];
    [query orderByDescending:@"createdAt"];
    [query findObjectsInBackgroundWithBlock:^(NSArray* objects, NSError *error) {
        NSLog(@"num objects: %lul", [objects count]);
        int yOrigin = self.navigationController.navigationBar.frame.size.height;
        if (objects != NULL) {
            for (PFObject* o in objects) {
                UITextView* tv = [[UITextView alloc] init];
                [tv setFrame:CGRectMake(50, yOrigin, self.view.frame.size.width/1.5, self.view.frame.size.width/1.5)];
                tv.backgroundColor = [UIColor whiteColor];
                //  tv.center = deedView.center;
                tv.text = [o objectForKey:@"deedString"];
                
                tv.font = [UIFont fontWithName:@"Futura" size:20];
                tv.editable = NO;
                //   [deedView addSubview:tv];
                //  [scrollView addSubview:deedView];
                yOrigin = yOrigin + tv.frame.size.height+40;
                NSLog(@"yorig : %d", yOrigin);
                [scrollView addSubview:tv];
                if (yOrigin > scrollView.contentSize.height) {
                    scrollView.contentSize = CGSizeMake(300, scrollView.contentSize.height + 5000);
                }
            }
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
 // Pass the selected object to the new view controller.
 }
 */

@end
