//
//  ViewController.m
//  DRExit
//
//  Created by mac on 16/4/7.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)exitApp:(id)sender {
    
    [self exitApplication:false];
}
- (IBAction)exitAppWithTransitionAnimation:(id)sender {
    
    [self exitApplication:true];
}

- (void)exitApplication:(BOOL)animated
{
    if (!animated) {
        exit(1);
        return;
    }
    
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    
    [UIView animateWithDuration:0.3f animations:^{
        
        window.transform = CGAffineTransformMakeScale(1.0, 1/[UIScreen mainScreen].bounds.size.height);
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.5f animations:^{
            window.transform = CGAffineTransformMakeScale(1/[UIScreen mainScreen].bounds.size.width, 1/[UIScreen mainScreen].bounds.size.height);
        } completion:^(BOOL finished) {
            exit(1);
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
