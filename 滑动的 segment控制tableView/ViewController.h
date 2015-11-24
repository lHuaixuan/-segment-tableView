//
//  ViewController.h
//  滑动的 segment控制tableView
//
//  Created by admin on 15/11/24.
//  Copyright (c) 2015年 刘怀轩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource , UITableViewDelegate>

@property (nonatomic , strong) UITableView *tableView;
@property (nonatomic , strong) UIScrollView *scrollView;
@property (nonatomic , strong) UISegmentedControl *segment;
@end

