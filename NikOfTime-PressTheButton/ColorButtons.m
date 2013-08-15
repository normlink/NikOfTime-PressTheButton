//
//  ColorButtons.m
//  NikOfTime-PressTheButton
//
//  Created by Yaniv Kerem on 8/14/13.
//  Copyright (c) 2013 Norm Gershon. All rights reserved.
//

#import "ColorButtons.h"

@implementation ColorButtons

@synthesize pressButtonsDelegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [pressButtonsDelegate didClickGame1View:self];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
