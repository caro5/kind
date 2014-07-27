//
//  AppDelegate.m
//  kind
//
//  Created by Caroline Wong on 7/10/14.
//  Copyright (c) 2014 madebycaro. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "ProfileViewController.h"
#import "KindFeedViewController.h"
#import "StatsViewController.h"
#import "CreateDeedViewController.h"
#import "MoreViewController.h"


@implementation AppDelegate
@synthesize navController, tabB;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [Parse setApplicationId:@"hSl3KtKk3rvAoG7JLqkaZawyXmXeYUaXj1E5tPXU"
                  clientKey:@"oFb2ssxxynePwqo3QSbg91qfomRns4Xzj7sqOskl"];
    
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    tabB = [[UITabBarController alloc] init];
    pVC = [[ProfileViewController alloc] init];
    pVC.title = @"profile";
    kVC = [[KindFeedViewController alloc] init];
    kVC.title = @"feed";
    sVC = [[StatsViewController alloc] init];
    sVC.title = @"stats";
    cVC = [[CreateDeedViewController alloc] init];
    cVC.title = @"add";
    mVC = [[MoreViewController alloc] init];
    mVC.title = @"more";
    
    UINavigationController* pinNav = [[UINavigationController alloc] initWithRootViewController:pVC];
    UINavigationController* feedNav = [[UINavigationController alloc] initWithRootViewController:kVC];
    UINavigationController* statsNav = [[UINavigationController alloc] initWithRootViewController:sVC];
    UINavigationController* deedNav = [[UINavigationController alloc] initWithRootViewController:cVC];
    UINavigationController* moreVC = [[UINavigationController alloc] initWithRootViewController:mVC];
    
    tabB.viewControllers = @[pinNav, feedNav, statsNav, deedNav, moreVC];
    

    FirstViewController* fVC = [[FirstViewController alloc] init];
     UINavigationController* navVC = [[UINavigationController alloc] initWithRootViewController:fVC];
    [self.window setRootViewController:navVC];
    
    [self.window makeKeyAndVisible];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
