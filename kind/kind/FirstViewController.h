//
//  FirstViewController.h
//  kind
//
//  Created by Caroline Wong on 7/10/14.
//  Copyright (c) 2014 madebycaro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface FirstViewController : UIViewController <UINavigationControllerDelegate, UITextFieldDelegate>

@property (nonatomic, strong) UIButton* logIn;
@property (nonatomic, retain) UIButton* signUp;
@property (nonatomic, strong) UIButton* addTags;





@end
