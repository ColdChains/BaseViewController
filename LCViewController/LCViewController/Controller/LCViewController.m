//
//  LCViewController.m
//  LCViewController
//
//  Created by lax on 2022/5/18.
//

#import "LCViewController.h"
#import "LCBaseHeader.h"

@implementation LCViewController

- (BOOL)prefersStatusBarHidden {
    return NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

- (BOOL)prefersHomeIndicatorAutoHidden {
    return YES;
}

- (UIModalPresentationStyle)modalPresentationStyle {
    return UIModalPresentationFullScreen;
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (void)setShowNavigationBar:(BOOL)showNavigationBar {
    _showNavigationBar = showNavigationBar;
    if (!self.isViewLoaded) { return; }
    if (showNavigationBar) {
        [_navigationBar removeFromSuperview];
        _navigationBar = [[LCNavigationBar alloc] init];
        _navigationBar.delegate = self;
        [_navigationBar addLeftItem];
        [self.view addSubview:_navigationBar];
        [self.view bringSubviewToFront:_navigationBar];
        [self.navigationBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(self.view);
            make.height.mas_equalTo(LCBASE_STATUSBAR_HEIGHT + 44);
        }];
    } else if (self.navigationBar) {
        [self.navigationBar removeFromSuperview];
        self.navigationBar = nil;
    }
}

- (void)setDisablePopGestureRecognizer:(BOOL)disablePopGestureRecognizer {
    _disablePopGestureRecognizer = disablePopGestureRecognizer;
    if (!self.isViewLoaded) { return; }
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = self.disablePopGestureRecognizer;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = LCBaseConfig.shared.backgroundColor;
    self.showNavigationBar = _showNavigationBar;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = !self.showSystemNavagationBar;
    if (LCBaseConfig.shared.logEnabled) {
        NSLog(@"[%p] [%@] [%@]", self, NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (self.disablePopGestureRecognizer && [self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = !self.disablePopGestureRecognizer;
    }
    if (LCBaseConfig.shared.logEnabled) {
        NSLog(@"[%p] [%@] [%@]", self, NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (self.disablePopGestureRecognizer && [self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
    if (LCBaseConfig.shared.logEnabled) {
        NSLog(@"[%p] [%@] [%@]", self, NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    if (LCBaseConfig.shared.logEnabled) {
        NSLog(@"[%p] [%@] [%@]", self, NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    }
}

- (void)dealloc {
    if (LCBaseConfig.shared.logEnabled) {
        NSLog(@"[%p] [%@] [%@]", self, NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    }
}

// MARK: 导航栏

// 返回/关闭事件
- (void)backAction {
    if ([self isPresent]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (BOOL)isPresent {
    if(!self.presentingViewController) {
        return NO;
    }
    if(self.navigationController && self.navigationController.viewControllers.count > 1){
        return NO;
    }
    return YES;
}

// 点击返回按钮
- (void)didSelectLeftItem {
    [self backAction];
}

// 点击关闭按钮
- (void)didSelectCloseItem {
    [self backAction];
}

// 点击右侧按钮
- (void)didSelectRightItem {
    
}

@end
