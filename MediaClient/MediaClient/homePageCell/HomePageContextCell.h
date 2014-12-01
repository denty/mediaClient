//
//  HomePageContextCell.h
//  MediaClient
//
//  Created by broy denty on 14-12-1.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RotatedTableViewCell.h"

@interface HomePageContextCell : RotatedTableViewCell <UITableViewDelegate ,UITableViewDataSource>
@property UITableView *context_tableView;
@end
