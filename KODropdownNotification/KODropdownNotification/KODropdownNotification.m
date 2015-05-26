//
//  KODropdownNotification.m
//  KODropdownNotification
//
//  Created by okohtenko on 25/05/15.
//  Copyright (c) 2015 kohtenko. All rights reserved.
//

#import "KODropdownNotification.h"

@interface KODropdownNotification (){
    CGFloat lastY;
}
@property (nonatomic, strong) NSLayoutConstraint *heightConstraint;
@property (nonatomic, strong) NSLayoutConstraint *topConstraint;

@property (nonatomic, strong) UIPanGestureRecognizer *panGesture;
@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;
@end

@implementation KODropdownNotification

- (instancetype)initWithNibName:(NSString *)nibNameOrNil{
    UINib *nib = [UINib nibWithNibName:nibNameOrNil bundle:nil];
    id object = [nib instantiateWithOwner:nil options:nil].lastObject;
    if ([object isKindOfClass: KODropdownNotification.class]){
        self = (KODropdownNotification *)object;
        self.notificationHeight = self.bounds.size.height;
    }else if(self = [super init]){
        self.notificationHeight = 64;
    }
    self.dismissOnTap = YES;
    self.dismissOnSwipe = YES;
    self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap)];
    [self addGestureRecognizer:self.tapGesture];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    return self;
}


- (void)showAnimated:(BOOL)animated{
    UIView *view = [UIApplication sharedApplication].keyWindow;
    [view addSubview:self];
    NSDictionary *views = @{@"notification" : self};
    if(!self.heightConstraint){
        self.heightConstraint = [NSLayoutConstraint constraintWithItem:self
                                                             attribute:NSLayoutAttributeHeight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:nil
                                                             attribute:NSLayoutAttributeNotAnAttribute
                                                            multiplier:1
                                                              constant:self.notificationHeight];
        [self addConstraint:self.heightConstraint];
    }
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[notification]-0-|"
                                                                 options:NSLayoutFormatAlignAllBaseline
                                                                 metrics:nil
                                                                   views:views]];
    self.topConstraint = [NSLayoutConstraint constraintWithItem:self
                                                      attribute:NSLayoutAttributeTop
                                                      relatedBy:NSLayoutRelationEqual
                                                         toItem:view
                                                      attribute:NSLayoutAttributeTop
                                                     multiplier:1
                                                       constant:-self.notificationHeight];
    [view addConstraint:self.topConstraint];
    [view layoutIfNeeded];
    self.topConstraint.constant = 0;
    if (!animated)
        [view layoutIfNeeded];
    else
        [UIView animateWithDuration:0.3
                              delay:0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             [view layoutIfNeeded];
                         }
                         completion:nil];
}

- (void)dismissAnimated:(BOOL)animated{
    self.topConstraint.constant = -self.notificationHeight;
    if (!animated)
        [self.superview layoutIfNeeded];
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [self.superview layoutIfNeeded];
                     }
                     completion:^(BOOL finished) {
                         [self removeFromSuperview];
                         if ([self.delegate respondsToSelector:@selector(dropdownDidDismissed:)])
                             [self.delegate dropdownDidDismissed:self];
                     }];
}

- (void)setDismissOnSwipe:(BOOL)dismissOnSwipe{
    _dismissOnSwipe = dismissOnSwipe;
    if (dismissOnSwipe){
        self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan)];
        [self addGestureRecognizer:self.panGesture];
    }else{
        [self removeGestureRecognizer:self.panGesture];
        self.panGesture = nil;
    }
}

- (void)handleTap{
    switch (self.tapGesture.state) {
        case UIGestureRecognizerStateRecognized: {
            if ([self.delegate respondsToSelector:@selector(dropdownDidTapped:)])
                [self.delegate dropdownDidTapped:self];
            if (self.dismissOnTap)
                [self dismissAnimated:YES];
            break;
        }
        default: {
            break;
        }
    }
}

- (void)handlePan{
    switch (self.panGesture.state) {
        case UIGestureRecognizerStateBegan: {
            lastY = [self.panGesture locationInView:self.superview].y;
            break;
        }
        case UIGestureRecognizerStateChanged: {
            CGFloat y = [self.panGesture locationInView:self.superview].y;
            CGFloat diff = lastY - y;
            CGFloat newValue = self.topConstraint.constant - diff;
            if (newValue <= 0){
                self.topConstraint.constant = newValue;
                [self.superview layoutIfNeeded];
            }
            lastY = y;
            
            break;
        }
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed:{
            if ([self.panGesture velocityInView:self.superview].y < -300){
                [self dismissAnimated:YES];
            }else{
                if (fabs(self.topConstraint.constant) < self.notificationHeight / 2.0){
                    self.topConstraint.constant = 0;
                    [UIView animateWithDuration:0.3
                                          delay:0
                                        options:UIViewAnimationOptionCurveEaseInOut
                                     animations:^{
                                         [self.superview layoutIfNeeded];
                                     }
                                     completion:nil];
                }else{
                    [self dismissAnimated:YES];
                }
            }
            break;
        }
        default:
            break;
    }
}

@end
