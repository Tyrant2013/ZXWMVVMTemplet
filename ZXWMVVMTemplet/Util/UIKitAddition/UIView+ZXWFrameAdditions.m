//
//  UIView+ZXWFrameAdditions.m
//  ZXWMVVMTemplet
//
//  Created by 庄晓伟 on 16/3/24.
//  Copyright © 2016年 Zhuang Xiaowei. All rights reserved.
//

#import "UIView+ZXWFrameAdditions.h"

@implementation UIView (ZXWFrameAdditions)

- (CGFloat)zxw_x {
    return CGRectGetMinX(self.frame);
}

- (void)setZxw_x:(CGFloat)zxw_x {
    self.frame = CGRectMake(zxw_x, CGRectGetMinY(self.frame), CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
}

- (CGFloat)zxw_y {
    return CGRectGetMinY(self.frame);
}

- (void)setZxw_y:(CGFloat)zxw_y {
    self.frame = CGRectMake(CGRectGetMinX(self.frame), zxw_y, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
}

- (CGFloat)zxw_width {
    return CGRectGetWidth(self.frame);
}

- (void)setZxw_width:(CGFloat)zxw_width {
    self.frame = CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame), zxw_width, CGRectGetHeight(self.frame));
}

- (CGFloat)zxw_height {
    return CGRectGetHeight(self.frame);
}

- (void)setZxw_height:(CGFloat)zxw_height {
    self.frame = CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame), CGRectGetWidth(self.frame), zxw_height);
}

@end
