//
//  ZXWTableViewController.h
//  ZXWMVVMTemplet
//
//  Created by 庄晓伟 on 16/3/24.
//  Copyright © 2016年 Zhuang Xiaowei. All rights reserved.
//

#import "ZXWViewController.h"

@interface ZXWTableViewController : ZXWViewController <
  UITableViewDataSource,
  UITableViewDelegate,
  UISearchBarDelegate
>

@property (nonatomic, weak, readonly) UISearchBar               *searchBar;
@property (nonatomic, weak, readonly) UITableView               *tableView;
@property (nonatomic, assign, readonly) UIEdgeInsets            contentInset;

- (void)reloadData;
- (UITableViewCell *)tableView:(UITableView *)tableView dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath withObject:(id)object;

@end
