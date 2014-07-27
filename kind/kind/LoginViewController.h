//
//  LoginViewController.h
//  kind
//
//  Created by Caroline Wong on 7/10/14.
//  Copyright (c) 2014 madebycaro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UITextField* username;
@property (nonatomic, strong) UITextField* password;
@property (nonatomic, strong) UIButton* login;
@property (nonatomic, strong) UIButton* toSignUp;



@end
