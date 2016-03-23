//
//  ZXWViewModel.m
//  ZXWMVVMTemplet
//
//  Created by 庄晓伟 on 16/3/23.
//  Copyright © 2016年 Zhuang Xiaowei. All rights reserved.
//

#import "ZXWViewModel.h"

@interface ZXWViewModel()

@property (nonatomic, strong, readwrite) id<ZXWViewModelServices>           services;
@property (nonatomic, copy, readwrite) NSDictionary                         *params;
@property (nonatomic, strong, readwrite) RACSubject                         *errors;
@property (nonatomic, strong, readwrite) RACSubject                         *willDisappearSignal;

@end

@implementation ZXWViewModel

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    ZXWViewModel *viewModel = [super allocWithZone:zone];
    
    @weakify(viewModel)
    [[viewModel
      rac_signalForSelector:@selector(initWithServices:params:)]
     subscribeNext:^(id x) {
        @strongify(viewModel);
        [viewModel initialize];
    }];
    return viewModel;
}

- (instancetype)initWithServices:(id<ZXWViewModelServices>)services params:(NSDictionary *)params {
    if (self = [super init]) {
        self.shouldFetchLocalDataOnViewModelInitialize = YES;
        self.shouldRequestRemoteDataOnViewDidLoad = YES;
        self.title = params[@"title"];
        self.services = services;
        self.params = params;
    }
    return self;
}

- (void)initialize {
    
}

#pragma mark - Getter

- (RACSubject *)errors {
    if (!_errors) {
        _errors = [RACSubject subject];
    }
    return _errors;
}

- (RACSubject *)willDisappearSignal {
    if (!_willDisappearSignal) {
        _willDisappearSignal = [RACSubject subject];
    }
    return _willDisappearSignal;
}

@end
