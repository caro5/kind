//
//  SignUpViewController.h
//  kind
//
//  Created by Caroline Wong on 7/10/14.
//  Copyright (c) 2014 madebycaro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface SignUpViewController : UIViewController <UITextFieldDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UITextField* nameField;
@property (nonatomic, strong) UITextField* email;
@property (nonatomic, strong) UITextField* password;
@property (nonatomic, strong) UIButton* signUpButton;
@property (nonatomic, strong) UIButton* goToLogIn;

@end
