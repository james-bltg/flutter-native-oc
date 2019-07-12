//
//  NativeViewController.m
//  Runner
//
//  Created by James on 10/07/2019.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import "NativeViewController.h"

@interface NativeViewController ()

@end

@implementation NativeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	[self.navigationController setNavigationBarHidden:NO animated:NO];
	
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)viewWillDisappear:(BOOL)animated {
	[self.navigationController setNavigationBarHidden:YES animated:NO];
}

@end
