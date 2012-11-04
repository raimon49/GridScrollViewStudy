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
	// Do any additional setup after loading the view, typically from a nib.
    self.title = @"GridScroll";
    CGRect navigationRect = self.navigationController.navigationBar.frame;
    CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
    CGRect selfRect = CGRectMake(0,
                                 0,
                                 screenRect.size.width,
                                 screenRect.size.height - navigationRect.size.height);
    self.gridScrollView = [[GridScrollView alloc] initWithFrame:selfRect];
    [self.view addSubview:self.gridScrollView];
    
    for (int i=0; i<10; ++i) {
        UIView *item = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
        item.backgroundColor = [UIColor redColor];
        [self.gridScrollView addItem:item];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
