//
//  RCLE2ViewController.h
//  MathTools
//
//  Created by Richard Chien on 14-1-30.
//  Copyright (c) 2014年 Richard Chien. All rights reserved.
//

#import "RCViewController.h"

static const NSUInteger kA1TextTag = 1;
static const NSUInteger kB1TextTag = 2;
static const NSUInteger kC1TextTag = 3;
static const NSUInteger kA2TextTag = 4;
static const NSUInteger kB2TextTag = 5;
static const NSUInteger kC2TextTag = 6;
static const NSUInteger kRootXTag = 7;
static const NSUInteger kRootYTag = 8;

@interface RCLE2ViewController : RCViewController

- (IBAction)solve;
- (IBAction)clearAll;

@end
