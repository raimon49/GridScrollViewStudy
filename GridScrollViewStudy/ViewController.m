//
//  ViewController.m
//  GridScrollViewStudy
//
//  Created by raimon on 2012/11/04.
//  Copyright (c) 2012年 raimon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) GridScrollView *gridScrollView;

@end

@implementation ViewController

@synthesize gridScrollView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"GridScroll";
    CGRect navigationRect = self.navigationController.navigationBar.frame;
    CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
    CGRect selfRect = CGRectMake(0,
                                 0,
                                 screenRect.size.width,
                                 screenRect.size.height - navigationRect.size.height);
    self.gridScrollView = [[GridScrollView alloc] initWithFrame:selfRect];
    self.gridScrollView.delegate = self;
    [self.view addSubview:self.gridScrollView];

    for (int i=0; i<10; ++i) {
        UIView *item = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
        [item addSubview:[self createNumberedText:i
                                        withFrame:item.frame]];
        item.tag = i;
        item.backgroundColor = [UIColor redColor];
        [self.gridScrollView addItem:item];
    }
}

- (UILabel *)createNumberedText:(int)number withFrame:(CGRect)frame
{
    @autoreleasepool {
        UILabel *label = [[UILabel alloc] initWithFrame:frame];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor grayColor];
        label.font = [UIFont systemFontOfSize:100.0];
        // XXX deprecated in iOS 6
        // label.textAlignment = UITextAlignmentCenter;
        label.textAlignment = NSTextAlignmentCenter;
        label.text = [NSString stringWithFormat:@"%d", number];

        return label;
    }
}

- (void)didSelectItem:(UIView *)item
{
    [[[UIAlertView alloc] initWithTitle:@"didSelectItem"
                                message:[NSString stringWithFormat:@"select tag:%d", item.tag]
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil, nil] show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
