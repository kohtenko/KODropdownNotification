//
//  KODropdownNotification.h
//  KODropdownNotification
//
//  Created by okohtenko on 25/05/15.
//  Copyright (c) 2015 kohtenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KODropdownNotification;

@protocol KODropdownNotificationDelegate <NSObject>

- (void)dropdownDidDismissed:(KODropdownNotification *)dropdown;

@end

@interface KODropdownNotification : UIView

@property (nonatomic) CGFloat notificationHeight;

@property (nonatomic) BOOL dismissOnSwipe;

@property (nonatomic, weak) id<KODropdownNotificationDelegate> delegate;

- (instancetype)initWithNibName:(NSString *)nibNameOrNil;

- (void)showAnimated:(BOOL)animated;
- (void)dismissAnimated:(BOOL)animated;

@end
