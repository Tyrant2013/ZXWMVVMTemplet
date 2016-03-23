//
//  ZXWAppStoreService.h
//  ZXWMVVMTemplet
//
//  Created by 庄晓伟 on 16/3/23.
//  Copyright © 2016年 Zhuang Xiaowei. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZXWAppStoreService <NSObject>

- (RACSignal *)requestAppInfoFromAppStoreWithAppID:(NSString *)appID;

@end
