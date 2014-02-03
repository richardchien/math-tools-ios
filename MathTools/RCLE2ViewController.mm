//
//  RCLE2ViewController.m
//  MathTools
//
//  Created by Richard Chien on 14-1-30.
//  Copyright (c) 2014年 Richard Chien. All rights reserved.
//

#import "RCLE2ViewController.h"

@interface RCLE2ViewController ()

@end

@implementation RCLE2ViewController

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)solve
{
    UITextField *a1Text = (UITextField *)[self.view viewWithTag:kA1TextTag];
    UITextField *b1Text = (UITextField *)[self.view viewWithTag:kB1TextTag];
    UITextField *c1Text = (UITextField *)[self.view viewWithTag:kC1TextTag];
    UITextField *a2Text = (UITextField *)[self.view viewWithTag:kA2TextTag];
    UITextField *b2Text = (UITextField *)[self.view viewWithTag:kB2TextTag];
    UITextField *c2Text = (UITextField *)[self.view viewWithTag:kC2TextTag];
    UILabel *rootLabelX = (UILabel *)[self.view viewWithTag:kRootXTag];
    UILabel *rootLabelY = (UILabel *)[self.view viewWithTag:kRootYTag];
    
    [[self findFirstReponder] resignFirstResponder];
    rootLabelX.text = @"";
    rootLabelY.text = @"";
    
    if (![a1Text.text isEqualToString: @""] &&
        ![b1Text.text isEqualToString: @""] &&
        ![c1Text.text isEqualToString: @""] &&
        ![a2Text.text isEqualToString: @""] &&
        ![b2Text.text isEqualToString: @""] &&
        ![c2Text.text isEqualToString: @""]) {
        TwoUnknEquaRt root = solveTwoUnknownsEquation(frac(a1Text.text.doubleValue), frac(b1Text.text.doubleValue), frac(c1Text.text.doubleValue), frac(a2Text.text.doubleValue), frac(b2Text.text.doubleValue), frac(c2Text.text.doubleValue));
        
        NSString *rootStringX;
        NSString *rootStringY;
        
        if ([MathToolsBasic stringFromRationalNumber:root.x].length <= kLineMaxChar &&
            [MathToolsBasic stringFromRationalNumber:root.y].length <= kLineMaxChar)
        {
            rootStringX = [NSString stringWithFormat: @"x = %@\n≈ %@", [MathToolsBasic stringFromRationalNumber:root.x], [MathToolsBasic stringFromDoubleWithDefaultAccuracy:root.x.doubleValue()]];
            rootStringY = [NSString stringWithFormat: @"y = %@\n≈ %@", [MathToolsBasic stringFromRationalNumber:root.y], [MathToolsBasic stringFromDoubleWithDefaultAccuracy:root.y.doubleValue()]];
        }
        else {
            rootStringX = [NSString stringWithFormat: @"x ≈ %@", [MathToolsBasic stringFromDoubleWithDefaultAccuracy:root.x.doubleValue()]];
            rootStringY = [NSString stringWithFormat: @"y ≈ %@", [MathToolsBasic stringFromDoubleWithDefaultAccuracy:root.y.doubleValue()]];
        }
        
        rootLabelX.text = rootStringX;
        rootLabelY.text = rootStringY;
    }
    else
        [self.alert show];
}

- (IBAction)clearAll
{
    for (int i = kA1TextTag; i <= kC2TextTag; i ++)
        ((UITextField *)[self.view viewWithTag:i]).text = @"";
    for (int i = kRootXTag; i <= kRootYTag; i ++)
        ((UILabel *)[self.view viewWithTag:i]).text = @"";
}

@end
