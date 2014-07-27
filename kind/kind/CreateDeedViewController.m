//
//  CreateDeedViewController.m
//  kind
//
//  Created by Caroline Wong on 7/10/14.
//  Copyright (c) 2014 madebycaro. All rights reserved.
//

#import "CreateDeedViewController.h"
#import <Parse/Parse.h>

@interface CreateDeedViewController ()

@end

@implementation CreateDeedViewController
@synthesize deed, deedTextView, totalDeed, counterLabel, saveButton, cancelButton;


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
    [super viewDidDisappear:YES];

    totalDeed = [[UIView alloc] initWithFrame:CGRectMake(50, 80, self.view.frame.size.width/1.5, self.view.frame.size.width/1.5)];
    totalDeed.center = CGPointMake(self.view.frame.size.width/2, 80 + totalDeed.frame.size.height/2);
    totalDeed.backgroundColor = [UIColor grayColor];
    
    counterLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 80 + totalDeed.frame.size.height, 50, 30)];
    counterLabel.text = @"140";
    [self.view addSubview:totalDeed];
    [self.view addSubview:counterLabel];
    
    cancelButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [cancelButton setFrame:CGRectMake(30, 80, 20, 20)];
    [cancelButton setTitle:@"X" forState:UIControlStateNormal];
    cancelButton.backgroundColor = [UIColor whiteColor];
    [cancelButton addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    
    
    saveButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [saveButton setFrame:CGRectMake(totalDeed.center.x + totalDeed.frame.size.width/2 - 50, 80+totalDeed.frame.size.height, 50, 30)];
    [saveButton setTitle:@"share" forState:UIControlStateNormal];
    saveButton.backgroundColor = [UIColor whiteColor];
    [saveButton addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];

    
    deed = [[UITextField alloc] initWithFrame:CGRectMake(50, 150, 50, 30)];
    deed.placeholder = @"share your deed";
    deed.delegate = self;
    deed.center = totalDeed.center;
    deed.textColor = [UIColor whiteColor];
    
    CGRect frameRect = deed.frame;
    frameRect.size.height = 53;
    deed.frame = frameRect;
    
    deedTextView = [[UITextView alloc] initWithFrame:CGRectMake(50, 150, self.view.frame.size.width/1.5, self.view.frame.size.width/1.5)];
    deedTextView.backgroundColor = [UIColor clearColor];
    deedTextView.textColor = [UIColor whiteColor];
    deedTextView.font = [UIFont fontWithName:@"Futura" size:20];
    deedTextView.center = totalDeed.center;
    deedTextView.delegate = self;
    
    [self.view addSubview:deedTextView];
    [self.view addSubview:saveButton];
    [self.view addSubview:cancelButton];
}

-(void) textViewDidChange:(UITextView *)textView {
    
    int maxCount = 140;
    int showingCount = 0;
    NSString* string = [NSString stringWithString:textView.text];
    int strCount = (int) string.length;
    showingCount = maxCount - strCount;
    counterLabel.text = [NSString stringWithFormat:@"%d", showingCount];
    if (showingCount < 0) {
        counterLabel.textColor = [UIColor redColor];
        saveButton.userInteractionEnabled = NO;
        [saveButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [deedTextView resignFirstResponder];
    } else {
        counterLabel.textColor = [UIColor blackColor];
        saveButton.userInteractionEnabled = YES;
        [saveButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    
}

-(void)textViewDidBeginEditing:(UITextView *)textView {
    [deedTextView becomeFirstResponder];
}
-(void) share {
    NSLog(@"share pressed");
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Share this kindness?" message:nil delegate:self cancelButtonTitle:@"no" otherButtonTitles:@"yes", nil];
    [alert show];
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"buttonIndex  %lul", buttonIndex);
    if (buttonIndex == 1) {
        PFObject* deedObject = [PFObject objectWithClassName:@"Deed"];
        [deedObject setObject:deedTextView.text forKey:@"deedString"];
        [deedObject setObject:[PFUser currentUser] forKey:@"createdBy"];
        [deedObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if(succeeded) {
                UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Kindness shared" message:nil delegate:self cancelButtonTitle:@"great!" otherButtonTitles:nil];
                [alert show];
                [self cancel];
            } else {
                NSLog(@"Error: %@", error);
            }
        }];

    }
}

-(void)cancel {
    NSLog(@"cancel pressed");
    deedTextView.text = @"";
    counterLabel.text = @"140";
    [saveButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [deedTextView resignFirstResponder];
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
