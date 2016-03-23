//
//  ZXWTableViewModel.m
//  ZXWMVVMTemplet
//
//  Created by 庄晓伟 on 16/3/23.
//  Copyright © 2016年 Zhuang Xiaowei. All rights reserved.
//

#import "ZXWTableViewModel.h"

@interface ZXWTableViewModel()

@property (nonatomic, strong, readwrite) RACCommand                 *requestRemoteDataCommand;

@end

@implementation ZXWTableViewModel

- (void)initialize {
    [super initialize];
    
    self.page = 1;
    self.perPage = 100;
    
    @weakify(self)
    self.requestRemoteDataCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(NSNumber *page) {
        @strongify(self)
        return [[self requestRemoteDataSignalWithPage:page.unsignedIntegerValue]
                takeUntil:self.rac_willDeallocSignal];
    }];
    
    [[self.requestRemoteDataCommand.errors
      filter:[self requestRemoteDataErrorFilter]]
     subscribe:self.errors];
}

- (BOOL (^)(NSError *error))requestRemoteDataErrorFilter {
    return ^(NSError *error) {
        return YES;
    };
}

- (id)fetchLocalData {
    return nil;
}

- (NSUInteger)offsetForPage:(NSUInteger)page {
    return (page - 1) * self.perPage;
}

- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page {
    return [RACSignal empty];
}

@end
