//
//  AppDelegate.h
//  kind
//
//  Created by Caroline Wong on 7/10/14.
//  Copyright (c) 2014 madebycaro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, UIToolbarDelegate> {
    UIViewController* pVC;
    UIViewController* kVC;
    UIViewController* sVC;
    UIViewController* cVC;
    UIViewController *mVC;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController* navController;
@property (strong, nonatomic)  UITabBarController* tabB;

@end


/*
11:35


*/