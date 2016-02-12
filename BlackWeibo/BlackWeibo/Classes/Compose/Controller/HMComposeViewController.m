//
//  HMComposeViewController.m
//  BlackWeibo
//
//  Created by Wenxuan Chen on 12/18/15.
//  Copyright © 2015 Wenxuan Chen. All rights reserved.
//

#import "HMComposeViewController.h"

@interface HMComposeViewController ()

@end

@implementation HMComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"发微博";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发微博" style:UIBarButtonItemStylePlain target:self action:@selector(createWeibo)];
    self.navigationItem.rightBarButtonItem.enabled = NO;
}

- (void)cancel {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)createWeibo {
    NSLog(@"Weibo created");
}

@end
