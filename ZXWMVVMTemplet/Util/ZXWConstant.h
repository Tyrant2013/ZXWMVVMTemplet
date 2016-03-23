//
//  ZXWConstant.h
//  ZXWMVVMTemplet
//
//  Created by 庄晓伟 on 16/3/23.
//  Copyright © 2016年 Zhuang Xiaowei. All rights reserved.
//

#ifndef ZXWConstant_h
#define ZXWConstant_h

///-----
///NSLog
///-----

#ifdef DEBUG
    #define NSLog(...) NSLog(__VA_ARGS__)
#else
    #define NSLog(...) {}
#endif

#define ZXWLogError(error) NSLog(@"Error: %@", error)

///-----
///Block
///-----

typedef void (^VoidBlock)();
typedef BOOL (^BoolBlock)();
typedef int  (^IntBlock) ();
typedef id   (^IDBlock)  ();

typedef void (^VoidBlock_int)(int);
typedef BOOL (^BoolBlock_int)(int);
typedef int  (^IntBlock_int) (int);
typedef id   (^IDBlock_int)(int);

typedef void (^VoidBlock_string)(NSString *);
typedef BOOL (^BoolBlock_string)(NSString *);
typedef int  (^IntBlock_string) (NSString *);
typedef id   (^IDBlock_string)  (NSString *);

typedef void (^VoidBlock_id)(id);
typedef BOOL (^BoolBlock_id)(id);
typedef int  (^IntBlock_id) (id);
typedef id   (^IDBlock_id)  (id);

///-----
///Color
///-----

#define RGB(r, g, b) [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
#define RGBAlpha(r, g, b, a) [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:a)]

#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define HexRGBAlpha(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]

#define SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define ZXW_1PX_WIDTH (1 / [UIScreen mainScreen].scale)

///---------
/// App Info
///---------

#define ZXW_APP_ID               @"961330940"
#define ZXW_APP_STORE_URL        @"https://itunes.apple.com/cn/app/id"ZXW_APP_ID"?mt=8"
#define ZXW_APP_STORE_REVIEW_URL @"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id="ZXW_APP_ID@"&onlyLatestVersion=true&pageNumber=0&sortOrdering=1&type=Purple+Software"

#define ZXW_APP_NAME    ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"])
#define ZXW_APP_VERSION ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"])
#define ZXW_APP_BUILD   ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"])

///-----
/// FMDB
///-----

#define ZXW_FMDB_PATH [NSString stringWithFormat:@"%@/%@.db", ZXW_DOCUMENT_DIRECTORY, ZXW_APP_NAME]
#define ZXWLogLastError(db) NSLog(@"lastError: %@, lastErrorCode: %d, lastErrorMessage: %@", [db lastError], [db lastErrorCode], [db lastErrorMessage]);

#endif /* ZXWConstant_h */
