//
//  ZXWTabBarController.m
//  ZXWMVVMTemplet
//
//  Created by 庄晓伟 on 16/3/24.
//  Copyright © 2016年 Zhuang Xiaowei. All rights reserved.
//

#import "ZXWTabBarController.h"
#import <objc/runtime.h>

@interface ZXWTabBarController()

@property (nonatomic, strong, readwrite) UITabBarController         *tabBarController;

@end

@implementation ZXWTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (BOOL)shouldAutorotate {
    return self.tabBarController.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return self.tabBarController.supportedInterfaceOrientations;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.tabBarController.preferredStatusBarStyle;
}

@end

@interface UITabBarController (ZXWStatusBarAdditions)

@end

@implementation UITabBarController (ZXWStatusBarAdditions)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        SEL originalSelector = @selector(preferredStatusBarStyle);
        SEL swizzledSelector = @selector(zxw_preferredStatusBarStyle);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL success = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (success) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        }
        else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

#pragma mark - Method Swizzling

- (UIStatusBarStyle)zxw_preferredStatusBarStyle {
    return self.selectedViewController.preferredStatusBarStyle;
}

@end
