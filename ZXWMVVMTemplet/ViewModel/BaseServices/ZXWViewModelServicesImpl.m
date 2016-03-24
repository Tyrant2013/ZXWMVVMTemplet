//
//  ZXWViewModelServicesImpl.m
//  ZXWMVVMTemplet
//
//  Created by 庄晓伟 on 16/3/23.
//  Copyright © 2016年 Zhuang Xiaowei. All rights reserved.
//

#import "ZXWViewModelServicesImpl.h"
#import "ZXWAppStoreServiceImpl.h"

@implementation ZXWViewModelServicesImpl

@synthesize appStoreService = _appStoreService;

- (instancetype)init {
    if (self = [super init]) {
        _appStoreService = [[ZXWAppStoreServiceImpl alloc] init];
    }
    return self;
}

- (void)pushViewModel:(ZXWViewModel *)viewModel animated:(BOOL)animated {
    
}

- (void)popViewModelAnimated:(BOOL)animated {
    
}

- (void)popToRootViewModelAnimated:(BOOL)animated {
    
}

- (void)presentViewModel:(ZXWViewModel *)viewModel animated:(BOOL)animated completion:(VoidBlock)completion {
    
}

- (void)dismissViewModelAnimated:(BOOL)animated completion:(VoidBlock)completion {
    
}

- (void)resetRootViewModel:(ZXWViewModel *)viewModel {
    
}

@end
