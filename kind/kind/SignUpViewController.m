//
//  SignUpViewController.m
//  kind
//
//  Created by Caroline Wong on 7/10/14.
//  Copyright (c) 2014 madebycaro. All rights reserved.
//

#import "SignUpViewController.h"
#import "LoginViewController.h"
#import "AllViewsViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController
@synthesize nameField, email, password, signUpButton, goToLogIn;

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
    
    
    nameField = [[UITextField alloc] initWithFrame:CGRectMake(50, 80, 200, 30)];
    nameField.delegate = self;
    nameField.placeholder = @"username";
    
    email = [[UITextField alloc] initWithFrame:CGRectMake(50, 130, 200, 30)];
    email.delegate = self;
    email.placeholder = @"email";
    
    password = [[UITextField alloc] initWithFrame:CGRectMake(50, 180, 200, 30)];
    password.delegate = self;
    password.placeholder = @"password";
    password.secureTextEntry = YES;
    
    signUpButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    signUpButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 230, 200, 30)];
    [signUpButton setTitle:@"SIGN UP" forState:UIControlStateNormal];
    signUpButton.backgroundColor = [UIColor grayColor];
    [signUpButton addTarget:self action:@selector(signUpUser) forControlEvents:UIControlEventTouchUpInside];
    
    goToLogIn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    goToLogIn = [[UIButton alloc] initWithFrame:CGRectMake(50, 280, 200, 30)];
    [goToLogIn setTitle:@"already have an account" forState:UIControlStateNormal];
    goToLogIn.backgroundColor = [UIColor grayColor];
    [goToLogIn addTarget:self action:@selector(toLogIn) forControlEvents:UIControlEventTouchUpInside];
   
    
    [self.view addSubview:nameField];
    [self.view addSubview:email];
    [self.view addSubview:password];
    [self.view addSubview:signUpButton];
    [self.view addSubview:goToLogIn];
    
}

-(void) signUpUser {
    
    //    AllViewsViewController* allVC = [[AllViewsViewController alloc] init];
    //      UINavigationController* navVC = [[UINavigationController alloc] initWithRootViewController:allVC];
    //    [self presentViewController:navVC animated:YES completion:nil];
    
    if (nameField.text.length == 0 || email.text.length == 0 || password.text.length == 0) {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"missing information" message:@"please fill out everything" delegate:nil cancelButtonTitle:@"okay" otherButtonTitles: nil];
        [alert show];
    } else {
        PFUser* user = [[PFUser alloc] init];
        user.username = nameField.text;
        user.email = email.text;
        user.password = password.text;
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Congrats!" message:@"successful sign up" delegate:nil cancelButtonTitle:@"okay" otherButtonTitles:nil];
                [alert show];
                [self dismissViewControllerAnimated:YES completion:nil];
            } else {
                UIAlertView* errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:[NSString stringWithFormat:@"%@", error] delegate:self cancelButtonTitle:@"okay" otherButtonTitles: nil];
                [errorAlert show];
            }
        }];
    }
       
}
-(void) toLogIn {
    NSLog(@"To log in");
    LoginViewController* lVC = [[LoginViewController alloc] init];
   [self dismissViewControllerAnimated:YES completion:nil];
    [self presentViewController:lVC animated:YES completion:nil];
    
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
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
