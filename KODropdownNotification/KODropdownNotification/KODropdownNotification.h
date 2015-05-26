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
@optional
/**
 *  Called when notification completely disappeared and removed from superview
 *
 *  @param dropdown current KODropdownNotification
 */
- (void)dropdownDidDismissed:(KODropdownNotification *)dropdown;

/**
 *  Called when user tapped notification
 *
 *  @param dropdown current KODropdownNotification
 */
- (void)dropdownDidTapped:(KODropdownNotification *)dropdown;

@end

@interface KODropdownNotification : UIView

/**
 *  Height of notification. By default retrived from XIB. If no XIB provided default is 64
 */
@property (nonatomic) CGFloat notificationHeight;

/**
 *  Value indicated whether should notification be dismissed after tap or not
 */
@property (nonatomic) BOOL dismissOnTap;

/**
 *  Value indicates whether should user be able to swipe notification up or not
 */
@property (nonatomic) BOOL dismissOnSwipe;

/**
 *  Notification delegate
 */
@property (nonatomic, weak) id<KODropdownNotificationDelegate> delegate;

- (instancetype)initWithNibName:(NSString *)nibNameOrNil;

/**
 *  Shows notification view in UIApplication keyWindow
 *
 *  @param animated pass YES if you want appearance animated, otherwise pass NO
 */
- (void)showAnimated:(BOOL)animated;

/**
 *  Hides notification and removes it from keyWindow
 *
 *  @param animated pass YES if you want appearance animated, otherwise pass NO
 */
- (void)dismissAnimated:(BOOL)animated;

/**
 *  Indicates if several notifications can be presented one above another.
 *
 *  Default value is NO
 *
 *  @return YES if only one posible, NO otherwise
 */
+ (BOOL)showOnlyOneNotification;

/**
 *  Indicates if several notifications can be presented one above another.
 *
 *  @param value YES if only one posible, NO otherwise
 */
+ (void)setShowOnlyOneNotification:(BOOL)value;

@end
