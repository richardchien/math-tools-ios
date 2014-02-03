//
//  RCViewController.h
//  MathTools
//
//  Created by Richard Chien on 14-1-29.
//  Copyright (c) 2014年 Richard Chien. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MathToolsBasic.h"
#import "RCInputAccessory.h"

static const NSUInteger kFirstTextTag = 1;

static const int kLineMaxChar = 18;

@interface RCViewController : UIViewController

@property (strong, nonatomic) RCInputAccessory *inputBar;
@property (strong, nonatomic) UIAlertView *alert;

- (UITextField *)findFirstReponder;

- (IBAction)backgroundTap;
- (IBAction)solve;
- (IBAction)clearAll;

@end
