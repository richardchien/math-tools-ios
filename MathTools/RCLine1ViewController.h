//
//  RCLine1ViewController.h
//  MathTools
//
//  Created by Richard Chien on 14-1-30.
//  Copyright (c) 2014年 Richard Chien. All rights reserved.
//

#import "RCViewController.h"

static const NSUInteger kX1TextTag = 1;
static const NSUInteger kY1TextTag = 2;
static const NSUInteger kX2TextTag = 3;
static const NSUInteger kY2TextTag = 4;
static const NSUInteger kResultTag = 5;

@interface RCLine1ViewController : RCViewController

- (IBAction)solve;
- (IBAction)clearAll;

@end
