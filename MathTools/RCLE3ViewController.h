//
//  RCLE3ViewController.h
//  MathTools
//
//  Created by Richard Chien on 14-1-30.
//  Copyright (c) 2014年 Richard Chien. All rights reserved.
//

#import "RCViewController.h"

static const NSUInteger kA1TextTag = 1;
static const NSUInteger kB1TextTag = 2;
static const NSUInteger kC1TextTag = 3;
static const NSUInteger kD1TextTag = 4;
static const NSUInteger kA2TextTag = 5;
static const NSUInteger kB2TextTag = 6;
static const NSUInteger kC2TextTag = 7;
static const NSUInteger kD2TextTag = 8;
static const NSUInteger kA3TextTag = 9;
static const NSUInteger kB3TextTag = 10;
static const NSUInteger kC3TextTag = 11;
static const NSUInteger kD3TextTag = 12;
static const NSUInteger kRootXTag = 13;
static const NSUInteger kRootYTag = 14;
static const NSUInteger kRootZTag = 15;

@interface RCLE3ViewController : RCViewController

- (IBAction)solve;
- (IBAction)clearAll;

@end
