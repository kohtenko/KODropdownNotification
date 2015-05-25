//
//  MyOwnNotification.h
//  KODropdownNotification
//
//  Created by okohtenko on 25/05/15.
//  Copyright (c) 2015 kohtenko. All rights reserved.
//

#import "KODropdownNotification.h"

@class MyOwnNotification;
@protocol MyOwnNotificationDelegate <KODropdownNotificationDelegate>

- (void)rightButtonPressedOnNotification:(MyOwnNotification *)notification;

@end

@interface MyOwnNotification : KODropdownNotification

@property (nonatomic, weak) IBOutlet UILabel *label1;
@property (nonatomic, weak) IBOutlet UILabel *label2;
@property (nonatomic, weak) id<MyOwnNotificationDelegate> delegate;

@end
