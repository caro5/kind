//
//  LoginViewController.m
//  kind
//
//  Created by Caroline Wong on 7/10/14.
//  Copyright (c) 2014 madebycaro. All rights reserved.
//

#import "LoginViewController.h"
#import "SignUpViewController.h"
#import "AllViewsViewController.h"
#import "AppDelegate.h"
@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize username, password, login, toSignUp;

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
    username = [[UITextField alloc] initWithFrame:CGRectMake(50, 80, 200, 30)];
    username.delegate = self;
    username.placeholder = @"username";
    
    password = [[UITextField alloc] initWithFrame:CGRectMake(50, 130, 200, 30)];
    password.delegate = self;
    password.placeholder = @"password";
    
    login = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    login = [[UIButton alloc] initWithFrame:CGRectMake(50, 180, 200, 30)];
    [login setTitle:@"log in" forState:UIControlStateNormal];
    login.backgroundColor = [UIColor grayColor];
    [login addTarget:self action:@selector(logInUser:) forControlEvents:UIControlEventTouchUpInside];
    
    toSignUp = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    toSignUp = [[UIButton alloc] initWithFrame:CGRectMake(50, 230, 200, 30)];
    [toSignUp setTitle:@"need to sign up" forState:UIControlStateNormal];
    toSignUp.backgroundColor = [UIColor grayColor];
    [toSignUp addTarget:self action:@selector(goToSignUp) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:username];
    [self.view addSubview:password];
    
    [self.view addSubview:login];
    [self.view addSubview:toSignUp];
    
}

-(void)logInUser:(id)sender {
    NSLog(@"in Login");
    [PFUser logInWithUsernameInBackground:username.text password:password.text block:^(PFUser *user, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"wrong info" message:@"please try again" delegate:self cancelButtonTitle:@"okay" otherButtonTitles: nil];
            [alert show];
        } else {
            NSLog(@"did log in");
            [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
            AppDelegate* appDel = (AppDelegate*)[UIApplication sharedApplication].delegate;
            [appDel.tabB setSelectedViewController:[appDel.tabB.viewControllers objectAtIndex:0]];
            [appDel.window setRootViewController:appDel.tabB];
        }
    }];
}
-(void)goToSignUp {
    NSLog(@"signuP ");
    SignUpViewController* sVC = [[SignUpViewController alloc] init];
    [self dismissViewControllerAnimated:YES completion:nil];
    [self presentViewController:sVC animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
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
