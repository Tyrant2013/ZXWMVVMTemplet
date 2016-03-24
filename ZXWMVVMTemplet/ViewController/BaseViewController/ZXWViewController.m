//
//  ZXWViewController.m
//  ZXWMVVMTemplet
//
//  Created by 庄晓伟 on 16/3/24.
//  Copyright © 2016年 Zhuang Xiaowei. All rights reserved.
//

#import "ZXWViewController.h"
#import "ZXWViewModel.h"

@interface ZXWViewController() <UIGestureRecognizerDelegate>

@property (nonatomic, strong, readwrite) ZXWViewModel                           *viewModel;
@property (nonatomic, strong, readwrite) UIPercentDrivenInteractiveTransition   *interactivePopTransition;

@end

@implementation ZXWViewController

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    ZXWViewController *viewController = [super allocWithZone:zone];
    
    @weakify(viewController)
    [[viewController
      rac_signalForSelector:@selector(viewDidLoad)]
     subscribeNext:^(id x) {
        @strongify(viewController)
        [viewController bindViewModel];
    }];
    return viewController;
}

- (ZXWViewController *)initWithViewModel:(id)viewModel {
    if (self = [super init]) {
        self.viewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.extendedLayoutIncludesOpaqueBars = YES;
    
    if (self.navigationController != nil && self != self.navigationController.viewControllers.firstObject) {
        UIPanGestureRecognizer *popRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePopRecognizer:)];
        [self.view addGestureRecognizer:popRecognizer];
        popRecognizer.delegate = self;
        
    }
}

- (void)bindViewModel {
    @weakify(self)
    /// System title view.
    RAC(self, title) = RACObserve(self.viewModel, title);
    
    UIView *titleView = self.navigationItem.titleView;
    
    RAC(self.navigationItem, titleView) = [RACObserve(self.viewModel, titleViewType).distinctUntilChanged map:^id(NSNumber *value) {
        ZXWTitleViewType titleViewType = value.unsignedIntegerValue;
        switch (titleViewType) {
            case ZXWTitleViewTypeDefault:
                return titleView;
            case ZXWTitleViewTypeDoubleTitle:
                return nil;
            case ZXWTitleViewTypeLoadingTitle:
                return nil;
        }
    }];
    
    [self.viewModel.errors subscribeNext:^(NSError *error) {
        @strongify(self)
        ZXWLogError(error);
        /// Deal with error.
        if ([error.domain isEqual:@""] && error.code == 1) {
            /// If login AuthenticationFailed, resetViewModel to login.
            ///
            /// ZXWLoginViewModel *loginViewModel = [[ZXWLoginViewModel alloc] initWithServices:self.viewModel.services];
            /// [self.viewModel.services resetRootViewModel:loginViewModel];
        }
        else if (error.code != 2 && error.code != 3) {
            /// Show error message.
        }
    }];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.viewModel.willDisappearSignal sendNext:nil];
    
    /// Being popped, take a snapshot
    if ([self isMovingFromParentViewController]) {
        self.snapshot = [self.navigationController.view snapshotViewAfterScreenUpdates:NO];
    }
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return isPad ? UIInterfaceOrientationMaskLandscape : UIInterfaceOrientationMaskPortrait;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - UIPanGestureRecognizer handlers

- (void)handlePopRecognizer:(UIPanGestureRecognizer *)recognizer {
    CGFloat progress = [recognizer translationInView:self.view].x / CGRectGetWidth(self.view.frame);
    progress = MIN(1.0f, MAX(0.0f, progress));
    
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:
            /// Create a interactive transition and pop the view controller.
            self.interactivePopTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
            [self.navigationController popViewControllerAnimated:YES];
            break;
        case UIGestureRecognizerStateChanged:
            /// Update the interactive transition's progress.
            [self.interactivePopTransition updateInteractiveTransition:progress];
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
            /// Finish or cancel the interactive transition.
            if (progress > 0.25f) {
                [self.interactivePopTransition finishInteractiveTransition];
            }
            else {
                [self.interactivePopTransition cancelInteractiveTransition];
            }
            self.interactivePopTransition = nil;
        default:
            break;
    }
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer {
    return [gestureRecognizer velocityInView:self.view].x > 0;
}

@end
