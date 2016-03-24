//
//  ZXWViewModel.h
//  ZXWMVVMTemplet
//
//  Created by 庄晓伟 on 16/3/23.
//  Copyright © 2016年 Zhuang Xiaowei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZXWViewModelServices.h"

/// The type of the title view.
typedef NS_ENUM(NSUInteger, ZXWTitleViewType) {
    /// System title view
    ZXWTitleViewTypeDefault,
    /// Double title view
    ZXWTitleViewTypeDoubleTitle,
    /// Loading title view
    ZXWTitleViewTypeLoadingTitle
};

/// An abstract class representing a view model.
@interface ZXWViewModel : NSObject

/// The 'services' parameter in '-initWithServices:params:' method.
@property (nonatomic, strong, readonly) id<ZXWViewModelServices>                services;

/// The 'params' parameter in '-initWithServices:params:' method.
@property (nonatomic, copy, readonly) NSDictionary                              *params;

@property (nonatomic, assign) ZXWTitleViewType                                  *titleViewType;
@property (nonatomic, copy) NSString                                            *title;
@property (nonatomic, copy) NSString                                            *subtitle;

/// The callback block.
@property (nonatomic, copy) VoidBlock_id                                        callback;

/// A RACSubject object, which representing all errors occurred in view model.
@property (nonatomic, strong, readonly) RACSubject                              *errors;

@property (nonatomic, assign) BOOL                                              shouldFetchLocalDataOnViewModelInitialize;
@property (nonatomic, assign) BOOL                                              shouldRequestRemoteDataOnViewDidLoad;
@property (nonatomic, strong, readonly) RACSubject                              *willDisappearSignal;

/// Initialization method. This is the preferred way to create a new view model.
///
/// services - The service bus of the 'Model' layer.
/// params   - The parameters to be passed to view model.
///
/// Returen a new view model.
- (instancetype)initWithServices:(id<ZXWViewModelServices>)services params:(NSDictionary *)params;

/// An additional method, in which you can initialize data, RACCommand etc.
///
/// This method will be execute after the execution of '-initWithServices:params:' method. But
/// the premise is that you need to inherit 'ZXWViewModel'.
- (void)initialize;

@end
