//
//  ViewController.m
//  滑动的 segment控制tableView
//
//  Created by admin on 15/11/24.
//  Copyright (c) 2015年 刘怀轩. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setMenu];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, self.view.frame.size.width, 1000)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview: self.tableView];
    // 修改tableView 分割线左边不到边的情况
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)])
    {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])
    {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    // tableView自适应高度和自动去掉多余的cell的个数
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 23;
    // 去掉tableView上面的空白部分
    self.edgesForExtendedLayout = UIRectEdgeNone;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
    {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (void)setMenu
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 2, 40);
    NSArray *array = @[@"特色美食" , @"生鲜果蔬" , @"滋补养生" , @"粮油调味" , @"茗酒饮品" , @"工艺精品" , @"家居饰品" , @"特色品牌"];
    self.segment = [[UISegmentedControl alloc]initWithItems:array];
    self.segment.frame = CGRectMake(0, 0, self.view.frame.size.width * 2, 40);
    self.segment.tintColor = [UIColor lightGrayColor];
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:17] , NSFontAttributeName , [UIColor blackColor], NSForegroundColorAttributeName , nil , nil];
    [self.segment setTitleTextAttributes:attributes forState:UIControlStateNormal];
    [self.segment addTarget:self action:@selector(menu:) forControlEvents:UIControlEventValueChanged];
    self.segment.selectedSegmentIndex = 0;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [scrollView addSubview:self.segment];
    [self.view addSubview:scrollView];

}
- (void)menu:(id)sender
{
    [self.tableView reloadData];
}

#pragma mark tableView delegate && dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld" , (long)[self.segment selectedSegmentIndex]];
    return cell;
}

@end
