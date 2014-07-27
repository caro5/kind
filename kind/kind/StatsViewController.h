//
//  StatsViewController.h
//  kind
//
//  Created by Caroline Wong on 7/10/14.
//  Copyright (c) 2014 madebycaro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatsViewController : UIViewController
@property (nonatomic, strong)UILabel* personalTitleLabel;
@property (nonatomic, strong) UILabel* personalCount15;
@property (nonatomic, strong) UILabel* personalMonthTitleLabel;
@property (nonatomic, strong) UILabel* personalMonthCount;
@property (nonatomic, strong) UILabel* personalTotalLabel;
@property (nonatomic, strong) UILabel* personalTotalCount;
@property (nonatomic, strong) UILabel* commTitle;
@property (nonatomic, strong) UILabel* commDailyTitleLabel;
@property (nonatomic, strong) UILabel* commDailyCount;
@property (nonatomic, strong) UILabel* commMonthTitleLabel;
@property (nonatomic, strong) UILabel* commMonthCount;
@property (nonatomic, strong) UILabel* commTotalTitleLabel;
@property (nonatomic, strong) UILabel* commTotalCount;

@end
