//
//  HomePageViewController.h
//  MediaClient
//
//  Created by broy denty on 14-12-1.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "preHeader.h"
#import "RotatedTableView.h"
#import "ViewController.h"

@interface HomePageViewController : ViewController <UITableViewDataSource,UITableViewDelegate>

@property UITableView *menu_tableView;
@property UITableView *contextHolder_tableView;
@end
