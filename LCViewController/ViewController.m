//
//  ViewController.m
//  LCViewController
//
//  Created by lax on 2022/5/23.
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
