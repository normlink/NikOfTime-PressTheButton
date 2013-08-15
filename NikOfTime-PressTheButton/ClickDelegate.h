//
//  ClickDelegate.h
//  NikOfTime-PressTheButton
//
//  Created by Yaniv Kerem on 8/14/13.
//  Copyright (c) 2013 Norm Gershon. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ColorButtons;

@protocol ClickDelegate <NSObject>

-(void) didClickGame1View: (ColorButtons *) thisView;

@end
