//
//  ViewController.m
//  SegmentControlTableViews
//
//  Created by 李蝉 on 15/5/6.
//  Copyright (c) 2015年 宜信-宜定盈. All rights reserved.
//

#import "ViewController.h"
#import "PPiFlatSegmentedControl.h"
#import "NSString+FontAwesome.h"

@interface ViewController ()
{
    PPiFlatSegmentedControl *segmented;

}
@property (strong, nonatomic) IBOutlet UIView *segmentControl;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) UITableView *remindTableView;
@property (strong, nonatomic) UITableView *planTableView;
@property (strong, nonatomic) UITableView *zoneTableView;

@end

@implementation ViewController



- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
    if (_segmentControl && !segmented) {
        //
        //    // Do any additional setup after loading the view, typically from a nib.
        segmented=[[PPiFlatSegmentedControl alloc] initWithFrame:self.segmentControl.frame
                                                                                    items:@[@{@"text":@"提醒",@"icon":@"icon-facebook"},@{@"text":@"计划",@"icon":@"icon-linkedin"},@{@"text":@"动态",@"icon":@"icon-twitter"}                                                      ]
                                                                             iconPosition:IconPositionRight andSelectionBlock:^(NSUInteger segmentIndex) {
                                                                             }];
        segmented.color=[UIColor colorWithRed:88.0f/255.0 green:88.0f/255.0 blue:88.0f/255.0 alpha:1];
        segmented.borderWidth=0.5;
        segmented.borderColor=[UIColor darkGrayColor];
        segmented.selectedColor=[UIColor colorWithRed:0.0f/255.0 green:141.0f/255.0 blue:147.0f/255.0 alpha:1];
        segmented.textAttributes=@{NSFontAttributeName:[UIFont systemFontOfSize:13],
                                   NSForegroundColorAttributeName:[UIColor whiteColor]};
        segmented.selectedTextAttributes=@{NSFontAttributeName:[UIFont systemFontOfSize:13],
                                           NSForegroundColorAttributeName:[UIColor whiteColor]};
        [self.view addSubview:segmented];
        
        
        _scrollView.contentSize = CGSizeMake(CGRectGetWidth(_scrollView.frame) * 3, CGRectGetHeight(_scrollView.frame));
        _remindTableView.frame = CGRectMake(0, 0, CGRectGetWidth(_scrollView.frame), CGRectGetHeight(_scrollView.frame));
        _remindTableView.tag = 0;
        _remindTableView.backgroundColor = [UIColor redColor];
        _planTableView.frame = CGRectMake(CGRectGetWidth(_scrollView.frame),0, CGRectGetWidth(_scrollView.frame), CGRectGetHeight(_scrollView.frame));
        _planTableView.tag = 1;
        _planTableView.backgroundColor = [UIColor blackColor];
        _zoneTableView.frame = CGRectMake(CGRectGetWidth(_scrollView.frame) * 2,0, CGRectGetWidth(_scrollView.frame), CGRectGetHeight(_scrollView.frame));
        _zoneTableView.tag = 2;
        _zoneTableView.backgroundColor = [UIColor orangeColor];
        
        [_scrollView addSubview:_remindTableView];
        [_scrollView addSubview:_planTableView];
        [_scrollView addSubview:_zoneTableView];
    }
    
     NSLog(@"%f",_scrollView.frame.size.width);

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%f",_scrollView.frame.size.width);


    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
