//
//  CreateDeedViewController.h
//  kind
//
//  Created by Caroline Wong on 7/10/14.
//  Copyright (c) 2014 madebycaro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateDeedViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate, UIAlertViewDelegate>

@property (nonatomic,strong) UITextField* deed;
@property (nonatomic,strong) UITextView* deedTextView;

@property (nonatomic, strong) UILabel* counterLabel;
@property (nonatomic, strong) UIView* totalDeed;

@property (nonatomic, strong) UIButton* cancelButton;
@property (nonatomic, strong) UIButton* saveButton;

@end
