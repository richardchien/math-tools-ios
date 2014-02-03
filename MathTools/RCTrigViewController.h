//
//  RCTrigViewController.h
//  MathTools
//
//  Created by Richard Chien on 14-1-30.
//  Copyright (c) 2014年 Richard Chien. All rights reserved.
//

#import "RCViewController.h"

static const NSUInteger kVarTextTag = 1;
static const NSUInteger kSinResultTag = 2;
static const NSUInteger kCosResultTag = 3;
static const NSUInteger kTanResultTag = 4;
static const NSUInteger kCotResultTag = 5;
static const NSUInteger kSegmentTag = 6;

@interface RCTrigViewController : RCViewController

- (IBAction)variableChanged;

@end
