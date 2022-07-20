//
//  ViewController.m
//  LCViewControllerDemo
//
//  Created by lax on 2022/7/20.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.showNavigationBar = YES;
    self.navigationBar.leftItem = nil;
    self.navigationBar.titleLabel.text = @"Hello";
    
}

@end
