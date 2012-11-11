//
//  GridScrollView.m
//  GridScrollViewStudy
//
//  Created by raimon on 2012/11/04.
//  Copyright (c) 2012年 raimon. All rights reserved.
//

#import "GridScrollView.h"

@interface GridScrollView ()

@property (strong, nonatomic) NSMutableArray *items;

@end

@implementation GridScrollView

@synthesize delegate, scrollView;
@synthesize items;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.items = [[NSMutableArray alloc] init];
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.scrollView.bounces = NO;
        [self addSubview:self.scrollView];
    }

    return self;
}

- (void)addItem:(UIView *)item
{
    [self.items addObject:item];
    [self.scrollView addSubview:item];
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectItem:)]) {
        item.userInteractionEnabled = YES;
        [item addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self
                                                                           action:@selector(handleTap:)]];
    }

    int itemCount = [self.items count];
    BOOL isOddItem = (itemCount % 2 == 1);
    if (isOddItem) {
        item.frame = CGRectMake(5,
                                5 * ceil([self.items count] / 2) + 150 * ceil([self.items count] / 2),
                                item.frame.size.width,
                                item.frame.size.height);
        [self redrawScrollView];
    } else {
        item.frame = CGRectMake(5 + 150 + 5,
                                5 * (ceil([self.items count] / 2) - 1) + 150 * ceil([self.items count] / 2 - 1),
                                item.frame.size.width,
                                item.frame.size.height);
    }
}

- (void)redrawScrollView
{
    float contentHeight = (150 + 10) * (ceil([self.items count] / 2) + 1);
    float contentWidth = self.scrollView.contentSize.width;

    self.scrollView.contentSize = CGSizeMake(contentWidth, contentHeight);
}

- (void)handleTap:(UIGestureRecognizer *)gestureRecognizer
{
    if ([self.delegate respondsToSelector:@selector(didSelectItem:)]) {
        UIView *selectedItem = gestureRecognizer.view;
        [self.delegate didSelectItem:selectedItem];
    }
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
