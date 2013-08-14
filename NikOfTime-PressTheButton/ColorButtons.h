//
//  ColorButtons.h
//  NikOfTime-PressTheButton
//
//  Created by Yaniv Kerem on 8/14/13.
//  Copyright (c) 2013 Norm Gershon. All rights reserved.
//
#import "ClickDelegate.h"
#import <UIKit/UIKit.h>

@interface ColorButtons : UIView

@property (strong, nonatomic) id <ClickDelegate> pressButtonsDelegate;

@end
