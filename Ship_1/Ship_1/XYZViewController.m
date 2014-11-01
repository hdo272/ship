//
//  XYZViewController.m
//  Ship_1
//
//  Created by Hillary Do on 10/31/14.
//  Copyright (c) 2014 ___SHIP___. All rights reserved.
//

#import "XYZViewController.h"
#import <FacebookSDK/FacebookSDK.h>

@interface XYZViewController ()

@end

@implementation XYZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    FBLoginView *loginView = [[FBLoginView alloc] init];
    // Align the button in the center horizontally
    loginView.frame = CGRectOffset(loginView.frame, (self.view.center.x - (loginView.frame.size.width / 2)), 5);
    [self.view addSubview:loginView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
