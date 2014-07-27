//
//  FeedScrollView.m
//  kind
//
//  Created by Caroline Wong on 7/11/14.
//  Copyright (c) 2014 madebycaro. All rights reserved.
//

#import "FeedScrollView.h"

@implementation FeedScrollView
@synthesize labelContainerView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentSize = CGSizeMake(5000, self.frame.size.height);
        labelContainerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.contentSize.width, self.contentSize.height/2)];
        [self addSubview:labelContainerView];
        [self.labelContainerView setUserInteractionEnabled:NO];
        [self setShowsVerticalScrollIndicator:NO];
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
