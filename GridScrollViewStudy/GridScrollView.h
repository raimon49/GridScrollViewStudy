//
//  GridScrollView.h
//  GridScrollViewStudy
//
//  Created by raimon on 2012/11/04.
//  Copyright (c) 2012年 raimon. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GridScrollViewDelegate <NSObject>

- (void)didSelectItem:(UIView *)item;

@end

@interface GridScrollView : UIView <UIScrollViewDelegate> {
    @public
     id <GridScrollViewDelegate> __weak delegate;
     UIScrollView *scrollView;
}

@property (weak, nonatomic) id <GridScrollViewDelegate> delegate;
@property (strong, nonatomic) UIScrollView *scrollView;

- (void)addItem:(UIView *)item;

@end
