//
//  RCCircleViewController.h
//  MathTools
//
//  Created by Richard Chien on 14-1-31.
//  Copyright (c) 2014年 Richard Chien. All rights reserved.
//

#import "RCViewController.h"

static const NSUInteger kX1TextTag = 1;
static const NSUInteger kY1TextTag = 2;
static const NSUInteger kX2TextTag = 3;
static const NSUInteger kY2TextTag = 4;
static const NSUInteger kX3TextTag = 5;
static const NSUInteger kY3TextTag = 6;
static const NSUInteger kImgViewTag = 7;
static const NSUInteger kResultDTag = 8;
static const NSUInteger kResultETag = 9;
static const NSUInteger kResultFTag = 10;

@interface RCCircleViewController : RCViewController

- (IBAction)solve;
- (IBAction)clearAll;

@end
