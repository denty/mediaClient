//
//  HomePageViewController.m
//  MediaClient
//
//  Created by broy denty on 14-12-1.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "HomePageViewController.h"
#import "HomePageContextCell.h"

@interface HomePageViewController ()

@end

@implementation HomePageViewController

#pragma mark - liftCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.menu_tableView = [[RotatedTableView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 120) style:UITableViewStylePlain];
    [self.menu_tableView setDelegate:self];
    [self.menu_tableView setDataSource:self];
    [self.menu_tableView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    [self.menu_tableView setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:self.menu_tableView];

    
    self.contextHolder_tableView = [[RotatedTableView alloc] initWithFrame:CGRectMake(0, 56 ,DEVICE_WIDTH, DEVICE_HEIGHT-(self.menu_tableView.frame.size.height-64)) style:UITableViewStylePlain];
    [self.contextHolder_tableView setDelegate:self];
    [self.contextHolder_tableView setDataSource:self];
    [self.contextHolder_tableView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    [self.contextHolder_tableView setBackgroundColor:[UIColor orangeColor]];
    [self.contextHolder_tableView setPagingEnabled:YES];
    [self.view addSubview:self.contextHolder_tableView];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource&UITableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.menu_tableView) {
        static NSString *cellIdenty = @"cell";
        RotatedTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdenty];
        if (cell == nil) {
            cell = [[RotatedTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdenty];
        }
        [cell.textLabel setText:[NSString stringWithFormat:@"%d",indexPath.row]];
        [cell.textLabel setTextAlignment:NSTextAlignmentCenter];
        [cell.contentView setBackgroundColor:[UIColor orangeColor]];
        [cell.layer setBorderColor:[UIColor blackColor].CGColor];
        [cell.layer setBorderWidth:0.5f];
        return cell;
    }
    else if (tableView == self.contextHolder_tableView)
    {
        static NSString *cellIdenty = @"cell";
        HomePageContextCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdenty];
        if (cell == nil) {
            cell = [[HomePageContextCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdenty];
        }
        [cell.context_tableView setFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT-(self.menu_tableView.frame.size.height-64))];
        [cell.context_tableView setBackgroundColor:[UIColor whiteColor]];
        return cell;
    }
    return [[UITableViewCell alloc] init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.menu_tableView) {
        return 10;
    }
    else if (tableView == self.contextHolder_tableView)
    {
        return 10;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.menu_tableView) {
        return 60;
    }
    if (tableView == self.contextHolder_tableView) {
        return DEVICE_WIDTH;
    }
    return 0;
}

@end
