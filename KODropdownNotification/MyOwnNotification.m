//
//  MyOwnNotification.m
//  KODropdownNotification
//
//  Created by okohtenko on 25/05/15.
//  Copyright (c) 2015 kohtenko. All rights reserved.
//

#import "MyOwnNotification.h"

@implementation MyOwnNotification
@synthesize delegate;

- (IBAction)hidePressed:(id)sender{
    [self dismissAnimated:NO];
}

- (IBAction)rightButtonPressed:(id)sender{
    if([self.delegate respondsToSelector:@selector(rightButtonPressedOnNotification:)])
        [self.delegate rightButtonPressedOnNotification:self];
}

@end
