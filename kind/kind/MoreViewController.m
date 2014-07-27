//
//  MoreViewController.m
//  kind
//
//  Created by Caroline Wong on 7/18/14.
//  Copyright (c) 2014 madebycaro. All rights reserved.
//

#import "MoreViewController.h"
#import "AppDelegate.h"
#import "FirstViewController.h"
#import <Parse/Parse.h>

@interface MoreViewController ()

@end

@implementation MoreViewController
@synthesize logOutButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    logOutButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [logOutButton setFrame:CGRectMake(50, 50, 200, 40)];
    logOutButton.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/3);
    [logOutButton setTitle:@"log out" forState:UIControlStateNormal];
    [logOutButton addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:logOutButton];
    // Do any additional setup after loading the view.
}

-(void)buttonPressed {
    UIActionSheet* actionSheet = [[UIActionSheet alloc] initWithTitle:@"are you sure you want to log out?" delegate:self cancelButtonTitle:@"no" destructiveButtonTitle:nil otherButtonTitles:@"yes", nil];
    [actionSheet showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
            [self logOut];
            break;
            
        default:
            break;
    }
}

-(void)logOut {
    [PFUser logOut];
    [self.navigationController popViewControllerAnimated:YES];
    AppDelegate* appDel = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    appDel.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[FirstViewController alloc] init]];
    

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
