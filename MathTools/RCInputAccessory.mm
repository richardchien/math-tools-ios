//
//  RCInputAccessory.m
//  MathTools
//
//  Created by Richard Chien on 14-1-29.
//  Copyright (c) 2014年 Richard Chien. All rights reserved.
//

#import "RCInputAccessory.h"
#import "RCViewController.h"
#import "RCTrigViewController.h"

@interface RCInputAccessory ()

- (IBAction)hide;
- (IBAction)clear;
- (IBAction)opposite;

@end

@implementation RCInputAccessory

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)hide
{
    UITextField *firstResponder = [_delegate findFirstReponder];
    [firstResponder resignFirstResponder];
}

- (IBAction)clear
{
    UITextField *firstResponder = [_delegate findFirstReponder];
    [firstResponder setText:@""];
    
    if ([_delegate isKindOfClass:[RCTrigViewController class]])
        [(RCTrigViewController *)_delegate variableChanged];
}

- (IBAction)opposite
{
    UITextField *firstResponder = [_delegate findFirstReponder];
    NSString *currentString = [NSString stringWithString: firstResponder.text];
    NSMutableString *editedString;
    if ([currentString hasPrefix: @"-"])
        editedString = [NSMutableString stringWithString: [currentString substringFromIndex: 1]];
    else {
        editedString = [NSMutableString stringWithString: @"-"];
        [editedString appendString:currentString];
    }
    [firstResponder setText:editedString];
}

@end
