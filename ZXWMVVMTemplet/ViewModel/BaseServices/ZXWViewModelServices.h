//
//  ZXWViewModelServices.h
//  ZXWMVVMTemplet
//
//  Created by 庄晓伟 on 16/3/23.
//  Copyright © 2016年 Zhuang Xiaowei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZXWNavigationProtocol.h"
#import "ZXWAppStoreService.h"

@protocol ZXWViewModelServices <NSObject, ZXWNavigationProtocol>

@required

@property (nonatomic, strong, readonly) id<ZXWAppStoreService>                  appStoreService;

@end
