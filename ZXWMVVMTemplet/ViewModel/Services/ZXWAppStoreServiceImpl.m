//
//  ZXWAppStoreServiceImpl.m
//  ZXWMVVMTemplet
//
//  Created by 庄晓伟 on 16/3/23.
//  Copyright © 2016年 Zhuang Xiaowei. All rights reserved.
//

#import "ZXWAppStoreServiceImpl.h"

@implementation ZXWAppStoreServiceImpl

- (RACSignal *)requestAppInfoFromAppStoreWithAppID:(NSString *)appID {
    return [[[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        /// 网络请求
        return [RACDisposable disposableWithBlock:^{
            /// 网络请求取消
        }];
    }] replayLazily] setNameWithFormat:@"-requestAppInfoFromAppStoreWithAppID: %@", appID];
}

@end
