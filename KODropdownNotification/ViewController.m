//
//  ViewController.m
//  KODropdownNotification
//
//  Created by okohtenko on 25/05/15.
//  Copyright (c) 2015 kohtenko. All rights reserved.
//

#import "ViewController.h"
#import "MyOwnNotification.h"


@interface ViewController () <MyOwnNotificationDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}

- (IBAction)showNotificationPressed:(id)sender{
    MyOwnNotification *notification = [[MyOwnNotification alloc] initWithNibName:@"MyOwnNotification"];
    notification.label1.text = @"Some Text";
    notification.label2.text = @"Some Text here too";
    notification.delegate = self;
    notification.dismissOnTap = NO;
    [notification showAnimated:YES];
}

- (void)dropdownDidDismissed:(KODropdownNotification *)dropdown{
    NSLog(@"dropdownDidDismissed");
}

- (void)dropdownDidTapped:(KODropdownNotification *)dropdown{
    NSLog(@"dropdownDidTapped");
}

- (void)rightButtonPressedOnNotification:(MyOwnNotification *)notification{
    NSLog(@"rightButtonPressedOnNotification");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
