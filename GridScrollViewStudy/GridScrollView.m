//
//  GridScrollView.m
//  GridScrollViewStudy
//
//  Created by raimon on 2012/11/04.
//  Copyright (c) 2012年 raimon. All rights reserved.
//

#import "GridScrollView.h"

@implementation GridScrollView

@synthesize scrollView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.scrollView.bounces = NO;
        [self addSubview:self.scrollView];
        // dummy child
        UIView *child = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 800)];
        child.backgroundColor = [UIColor redColor];
        self.scrollView.contentSize = CGSizeMake(320, 800);
        [self.scrollView addSubview:child];
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
