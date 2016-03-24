//
//  ZXWWebViewModel.m
//  ZXWMVVMTemplet
//
//  Created by 庄晓伟 on 16/3/24.
//  Copyright © 2016年 Zhuang Xiaowei. All rights reserved.
//

#import "ZXWWebViewModel.h"

@implementation ZXWWebViewModel

- (instancetype)initWithServices:(id<ZXWViewModelServices>)services params:(NSDictionary *)params {
    if (self = [super initWithServices:services params:params]) {
        self.request = params[@"request"];
    }
    return self;
}

@end
