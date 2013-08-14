//
//  ViewController.m
//  NikOfTime-PressTheButton
//
//  Created by Yaniv Kerem on 8/13/13.
//  Copyright (c) 2013 Norm Gershon. All rights reserved.
//
#import "ColorButtons.h"
#import "ViewController.h"

@interface ViewController ()
{
    int gameCounter;
    BOOL correct;
    UIColor *red;
    UIColor *blue;
    UIColor *yellow;
    NSArray *colorArray;
    NSMutableArray * gameArray;
    NSMutableDictionary *playDictionary;
    NSArray * viewArray;
    NSArray * colorLabelArray;
    NSMutableArray *playArray;
    NSMutableArray * muteColorArray;
    __weak IBOutlet UILabel *textInstruction;
    __weak IBOutlet UIView *buttonView0;
    __weak IBOutlet UILabel *successLabel;

    __weak IBOutlet UILabel *lossLabel;
    __weak IBOutlet UIView *buttonView1;
    
    __weak IBOutlet UIView *buttonView2;
}
- (IBAction)startDemo:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    red = [UIColor redColor];
    blue = [UIColor blueColor];
    yellow = [UIColor yellowColor];
    colorArray = @[red,blue,yellow];
    colorLabelArray = @[@"redColor", @"blueColor", @"yellowColor"];
    playDictionary = [[NSMutableDictionary alloc] initWithObjects:colorArray forKeys:colorLabelArray];
    viewArray = @[@(0), @(1), @(2)];
    
    //NSLog(@"clu%lu",(unsigned long)[colorLabelArray count]);
    muteColorArray = [[NSMutableArray alloc] initWithArray:colorLabelArray];
    
    [super viewDidLoad];
	
    for (UIView * subview in self.view.subviews){
        if ([subview isKindOfClass:[ColorButtons class]]) {
            ColorButtons * colorButton = (ColorButtons *) subview;
            colorButton.pressButtonsDelegate = self;
        }}
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startDemo:(id)sender {
    [successLabel setHidden:YES];
    [lossLabel setHidden:YES];
    gameCounter = 0;
    correct = NO;
    muteColorArray = [[NSMutableArray alloc] initWithArray:colorLabelArray];
    gameArray = [[NSMutableArray alloc] initWithCapacity:10];
    NSMutableArray* gameColorArray = [[NSMutableArray alloc] initWithArray:colorArray];
    NSMutableArray* newColorArray = [[NSMutableArray alloc] initWithCapacity:10];
    for (int num = 0; num <= ([muteColorArray count]+1); num++) {
        int counter = arc4random()%(3-num);
        [gameArray addObject:muteColorArray[counter]];
        [muteColorArray removeObjectAtIndex:counter];
        [newColorArray addObject:gameColorArray[counter]];
        [gameColorArray removeObjectAtIndex:counter];
        NSLog(@"colorarray %lu", (unsigned long)[newColorArray count]);
        
    } textInstruction.text = [NSString stringWithFormat:@"Press the %@ button then the %@ button", gameArray[0], gameArray[1]];
    playArray = [[NSMutableArray alloc] initWithCapacity:5];
    [playArray addObject:[playDictionary objectForKey:gameArray[0]]];
    [playArray addObject:[playDictionary objectForKey:gameArray[1]]];
    NSLog(@"playRray%i",[playArray count]);
    gameArray = nil;
    
    for (UIView * subview in self.view.subviews){
        for (int counter = 0; counter < 4; counter++) {
            if ([subview isKindOfClass:[ColorButtons class]]){
                if (subview.tag == counter){
                    subview.backgroundColor = newColorArray[counter];
                    [UIView animateWithDuration:0.1 animations:^{
                                         
                        subview.transform = CGAffineTransformScale(subview.transform, 0.01, 0.01);
                                         
                        } completion:^(BOOL finished) {
                                         
                            [UIView animateWithDuration:1.0 animations:^{
                                                              
                            subview.transform = CGAffineTransformScale(subview.transform, 100, 100);
                                     }];
                            }];
                }}
        }
    }

}
-(void) didClickView:(ColorButtons *)thisView
{
    if ((gameCounter == 0) && (thisView.backgroundColor == playArray[gameCounter])) {
        gameCounter++;
        correct = YES;
    }else if ((correct = YES) && (thisView.backgroundColor == playArray[gameCounter])){
        [successLabel setHidden:NO];
    }else{
        [lossLabel setHidden:NO];
    }
}

@end
