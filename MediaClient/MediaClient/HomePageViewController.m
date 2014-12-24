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
{
    NSIndexPath *m_selectPagePath;
}
@end

@implementation HomePageViewController

#pragma mark - liftCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;//ios7+ 适配
    
    self.menu_tableView = [[RotatedTableView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 60) style:UITableViewStylePlain];
    [self.menu_tableView setDelegate:self];
    [self.menu_tableView setDataSource:self];
    [self.menu_tableView setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:self.menu_tableView];

    
    self.contextHolder_tableView = [[RotatedTableView alloc] initWithFrame:CGRectMake(0, 60 ,DEVICE_WIDTH, DEVICE_HEIGHT-self.menu_tableView.frame.size.height-DEVICE_NAVI_HEIGHT-DEVICE_STATUS_HEIGHT) style:UITableViewStylePlain];
    [self.contextHolder_tableView setDelegate:self];
    [self.contextHolder_tableView setDataSource:self];
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
        if (m_selectPagePath == nil&&indexPath.row == 0) {
            [cell.contentView setBackgroundColor:[UIColor whiteColor]];
        }else if(m_selectPagePath.row == indexPath.row)
        {
            [cell.contentView setBackgroundColor:[UIColor whiteColor]];
        }
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cell;
    }
    else if (tableView == self.contextHolder_tableView)
    {
        static NSString *cellIdenty = @"cell";
        HomePageContextCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdenty];
        if (cell == nil) {
            cell = [[HomePageContextCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdenty];
        }
        [cell.context_tableView setFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT-self.menu_tableView.frame.size.height-DEVICE_STATUS_HEIGHT-DEVICE_NAVI_HEIGHT)];
        [cell.context_tableView setBackgroundColor:[UIColor whiteColor]];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
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
        return DEVICE_WIDTH/4;
    }
    if (tableView == self.contextHolder_tableView) {
        return DEVICE_WIDTH;
    }
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.menu_tableView) {
        NSLog(@"%d",indexPath.row);
        [self contextHolderTableViewScrollWithIndex:indexPath];
        m_selectPagePath = indexPath;
    }
}

#pragma mark - scrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView == self.contextHolder_tableView) {
        UITableViewCell * cell = [[self.contextHolder_tableView visibleCells] lastObject];
        NSIndexPath *indexPath = [self.contextHolder_tableView indexPathForCell:cell];
        NSLog(@"%d",indexPath.row);
        [self menuTabelViewScrollWithIndex:indexPath];
        m_selectPagePath = indexPath;
    }
}

- (void)menuTabelViewScrollWithIndex:(NSIndexPath *) indexPath
{
    [self.menu_tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    [self.menu_tableView reloadData];
}

- (void)contextHolderTableViewScrollWithIndex:(NSIndexPath *) indexPath
{
    [self.contextHolder_tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    [self.menu_tableView reloadData];
}
@end
