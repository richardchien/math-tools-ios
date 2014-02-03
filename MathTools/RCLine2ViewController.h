//
//  RCLine2ViewController.h
//  MathTools
//
//  Created by Richard Chien on 14-1-31.
//  Copyright (c) 2014年 Richard Chien. All rights reserved.
//

#import "RCViewController.h"

static const NSUInteger kX0TextTag = 1;
static const NSUInteger kY0TextTag = 2;
static const NSUInteger kATextTag = 3;
static const NSUInteger kBTextTag = 4;
static const NSUInteger kCTextTag = 5;
static const NSUInteger kResultTag = 6;

@interface RCLine2ViewController : RCViewController

- (IBAction)solve;
- (IBAction)clearAll;

@end
