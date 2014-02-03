//
//  RCEllipseViewController.h
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
static const NSUInteger kImgViewTag = 5;
static const NSUInteger kResultMTag = 6;
static const NSUInteger kResultNTag = 7;

@interface RCEllipseViewController : RCViewController

- (IBAction)solve;
- (IBAction)clearAll;

@end
