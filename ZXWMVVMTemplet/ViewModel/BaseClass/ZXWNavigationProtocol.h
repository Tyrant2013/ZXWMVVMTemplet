//
//  ZXWNavigationProtocol.h
//  ZXWMVVMTemplet
//
//  Created by 庄晓伟 on 16/3/23.
//  Copyright © 2016年 Zhuang Xiaowei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZXWViewModel.h"


@protocol ZXWNavigationProtocol <NSObject>
/// Pushs the corresponding view controller.
///
/// Uses a horizontal slide transition.
/// Has no effect if the corresponding view controller is already in the stack.
/// viewModel - the view model
/// animated  - use animation or not
- (void)pushViewModel:(ZXWViewModel *)viewModel animated:(BOOL)animated;

/// Pops the top view controller in the stack.
///
/// animated - use animated or not.
- (void)popViewModelAnimated:(BOOL)animated;

/// Pops until there's only a single view controller left on the stack.
///
/// animated - user animation or not.
- (void)popToRootViewModelAnimated:(BOOL)animated;

/// Present the corresponding view controller.
///
/// viewModel  - the view model
/// animated   - use animation or not
/// completion - the completion handler
- (void)presentViewModel:(ZXWViewModel *)viewModel animated:(BOOL)animated completion:(VoidBlock)completion;

/// Dismiss the presented view controller.
///
/// animated   - use animation or not
/// completion - the competion handler
- (void)dismissViewModelAnimated:(BOOL)animated completion:(VoidBlock)completion;

/// Reset the corresponding view controller as the root view controller of application's window.
///
/// viewModel - the view model
- (void)resetRootViewModel:(ZXWViewModel *)viewModel;

@end
