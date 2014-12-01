//
//  HomePageContextCell.m
//  MediaClient
//
//  Created by broy denty on 14-12-1.
//  Copyright (c) 2014年 denty. All rights reserved.
//
#import "HomePageContextCell.h"

@implementation HomePageContextCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
   self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.context_tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        [self.context_tableView setDelegate:self];
        [self.context_tableView setDataSource:self];
        [self addSubview:self.context_tableView];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.context_tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        [self.context_tableView setDelegate:self];
        [self.context_tableView setDataSource:self];
        [self addSubview:self.context_tableView];
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.context_tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        [self.context_tableView setDelegate:self];
        [self.context_tableView setDataSource:self];
        [self addSubview:self.context_tableView];
    }
    return self;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdenty = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdenty];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdenty];
    }
    [cell.textLabel setText:[NSString stringWithFormat:@"%d",indexPath.row]];
    [cell.textLabel setTextAlignment:NSTextAlignmentCenter];
    [cell.contentView setBackgroundColor:[UIColor orangeColor]];
    [cell.layer setBorderColor:[UIColor blackColor].CGColor];
    [cell.layer setBorderWidth:0.5f];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}
@end
