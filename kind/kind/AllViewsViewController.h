//
//  AllViewsViewController.h
//  kind
//
//  Created by Caroline Wong on 7/10/14.
//  Copyright (c) 2014 madebycaro. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ProfileViewController.h"
#import "KindFeedViewController.h"
#import "StatsViewController.h"
#import "CreateDeedViewController.h"

@interface AllViewsViewController : UIViewController <UIToolbarDelegate> {
  //  UINavigationController* navVC;
   // UISegmentedControl* segControl;
    UIView* containerView;
    UIViewController* pVC;
    UIViewController* kVC;
    UIViewController* sVC;
    UIViewController* cVC;
    
    //UIViewController* currVC;
  //  NSArray* viewControllers;
}

//-(void) valChanged:(UISegmentedControl*) sender;
@end
