//
//  GridScrollView.h
//  GridScrollViewStudy
//
//  Created by raimon on 2012/11/04.
//  Copyright (c) 2012年 raimon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GridScrollView : UIView <UIScrollViewDelegate> {
    @public
     UIScrollView *scrollView;
}

@property (strong, nonatomic) UIScrollView *scrollView;

- (void)addItem:(UIView *)item;

@end
