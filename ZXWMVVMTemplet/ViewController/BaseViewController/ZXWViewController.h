//
//  ZXWViewController.h
//  ZXWMVVMTemplet
//
//  Created by 庄晓伟 on 16/3/24.
//  Copyright © 2016年 Zhuang Xiaowei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZXWViewModel;

@interface ZXWViewController : UIViewController

/// The 'viewModel' parameter in '-initWithViewModel:' method.
@property (nonatomic, strong, readonly) ZXWViewModel                                        *viewModel;
@property (nonatomic, strong, readonly) UIPercentDrivenInteractiveTransition                *interactivePopTransition;
@property (nonatomic, strong) UIView                                                        *snapshot;

/// Initialization method. This is the preferred way to create a new view.
///
/// viewModel - corresponding view model
///
/// Returns a new view.
- (instancetype)initWithViewModel:(ZXWViewModel *)viewModel;

/// Bind the corresponding view model to the view.
- (void)bindViewModel;

@end
