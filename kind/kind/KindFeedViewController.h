//
//  KindFeedViewController.h
//  kind
//
//  Created by Caroline Wong on 7/10/14.
//  Copyright (c) 2014 madebycaro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface KindFeedViewController : UIViewController <UIScrollViewDelegate> {
    UIScrollView* scrollView;
    UIView* contentView;
}

-(void) query;
@end
