//
//  ZXWTableViewController.m
//  ZXWMVVMTemplet
//
//  Created by 庄晓伟 on 16/3/24.
//  Copyright © 2016年 Zhuang Xiaowei. All rights reserved.
//

#import "ZXWTableViewController.h"
#import "ZXWTableViewModel.h"

@interface ZXWTableViewController ()

@property (nonatomic, weak, readwrite) IBOutlet UISearchBar             *searchBar;
@property (nonatomic, weak, readwrite) IBOutlet UITableView             *tableView;
@property (nonatomic, strong, readonly) ZXWTableViewModel               *viewModel;

@end

@implementation ZXWTableViewController

@dynamic viewModel;

- (instancetype)initWithViewModel:(ZXWViewModel *)viewModel {
    if (self = [super initWithViewModel:viewModel]) {
        if ([viewModel shouldRequestRemoteDataOnViewDidLoad]) {
            @weakify(self)
            [[self rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(id x) {
                @strongify(self)
                [self.viewModel.requestRemoteDataCommand execute:@1];
            }];
        }
    }
    return self;
}

- (void)setView:(UIView *)view {
    [super setView:view];
    if ([view isKindOfClass:UITableView.class]) {
        self.tableView = (UITableView *)view;
    }
}

- (UIEdgeInsets)contentInset {
    return UIEdgeInsetsMake(64, 0, 0, 0);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.contentOffset = (CGPoint){self.searchBar.zxw_height - self.contentInset.top};
    self.tableView.contentInset = self.contentInset;
    self.tableView.scrollIndicatorInsets = self.contentInset;
    self.tableView.sectionIndexColor = [UIColor darkGrayColor];
    self.tableView.sectionIndexBackgroundColor = [UIColor clearColor];
    self.tableView.sectionIndexMinimumDisplayRowCount = 20;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reloadData {
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath withObject:(id)object {
    
}

@end
