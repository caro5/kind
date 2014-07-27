//
//  FirstViewController.m
//  kind
//
//  Created by Caroline Wong on 7/10/14.
//  Copyright (c) 2014 madebycaro. All rights reserved.
//

#import "FirstViewController.h"
#import "SignUpViewController.h"
#import "LoginViewController.h"
#import "AllViewsViewController.h"
#import "AppDelegate.h"
#import <Parse/Parse.h>

@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize signUp, addTags, logIn;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) viewDidAppear:(BOOL)animated {
    if (![PFUser currentUser]) {
        
        logIn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        logIn = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-50, self.view.frame.size.width/2, 50)];
        [logIn setTitle:@"LOG IN" forState:UIControlStateNormal];
        logIn.backgroundColor = [UIColor blackColor];
        [logIn addTarget:self action:@selector(logInAction) forControlEvents:UIControlEventTouchUpInside];
        
        signUp = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        signUp = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height-50, self.view.frame.size.width/2, 50)];
        [signUp setTitle:@"SIGN UP" forState:UIControlStateNormal];
        signUp.backgroundColor = [UIColor blackColor];
        [signUp addTarget:self action:@selector(signUpAction) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:logIn];
        [self.view addSubview:signUp];

    } else {
        //is PFUser

        [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
        AppDelegate* appDel = [UIApplication sharedApplication].delegate;
        [appDel.tabB setSelectedViewController:[appDel.tabB.viewControllers objectAtIndex:0]];
        [appDel.window setRootViewController:appDel.tabB];
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void) signUpAction {
    NSLog(@"sign up pressed");
    SignUpViewController* sVC = [[SignUpViewController alloc] init];
    [self presentViewController:sVC animated:YES completion:nil];
}

-(void) logInAction {
    NSLog(@"log in pressed");
    LoginViewController* lVC = [[LoginViewController alloc] init];
    [self presentViewController:lVC animated:YES completion:nil];
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
