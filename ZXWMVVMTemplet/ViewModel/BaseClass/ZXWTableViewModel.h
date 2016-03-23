//
//  ZXWTableViewModel.h
//  ZXWMVVMTemplet
//
//  Created by 庄晓伟 on 16/3/23.
//  Copyright © 2016年 Zhuang Xiaowei. All rights reserved.
//

#import "ZXWViewModel.h"

@interface ZXWTableViewModel : ZXWViewModel

/// The data source of table view.
@property (nonatomic, copy) NSArray                     *dataSource;

/// The list of section titles to display in section index view.
@property (nonatomic, copy) NSArray                     *sectionIndexTitles;

@property (nonatomic, assign) NSUInteger                page;
@property (nonatomic, assign) NSUInteger                perPage;
@property (nonatomic, assign) BOOL                      shouldPullToRefresh;
@property (nonatomic, assign) BOOL                      shouldInfiniteScrolling;
@property (nonatomic, copy) NSString                    *keyword;
@property (nonatomic, strong) RACCommand                *didSelectCommand;
@property (nonatomic, strong, readonly) RACCommand      *requestRemoteDataCommand;

- (id)fetchLocalData;

- (BOOL (^)(NSError *error))requestRemoteDataErrorFilter;

- (NSUInteger)offsetForPage:(NSUInteger)page;

- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page;

@end
