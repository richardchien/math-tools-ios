//
//  RCLE1ViewController.m
//  MathTools
//
//  Created by Richard Chien on 14-1-29.
//  Copyright (c) 2014年 Richard Chien. All rights reserved.
//

#import "RCLE1ViewController.h"

@interface RCLE1ViewController ()

@end

@implementation RCLE1ViewController

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
    UITextField *aText = (UITextField *)[self.view viewWithTag:kATextTag];
    UITextField *bText = (UITextField *)[self.view viewWithTag:kBTextTag];
    UITextField *cText = (UITextField *)[self.view viewWithTag:kCTextTag];
    UILabel *rootLabel = (UILabel *)[self.view viewWithTag:kRootTag];
    
    [[self findFirstReponder] resignFirstResponder];
    rootLabel.text = @"";
    
    if (aText.text.doubleValue != 0 && ![bText.text isEqualToString: @""] && ![cText.text isEqualToString: @""]) {
        LineEquaRt root = solveLinearEquation(frac(aText.text.doubleValue), frac(bText.text.doubleValue), frac(cText.text.doubleValue));
        NSString *rootString;
        if ([MathToolsBasic stringFromRationalNumber:root.x].length <= kLineMaxChar)
            rootString = [NSString stringWithFormat: @"x = %@\n≈ %@", [MathToolsBasic stringFromRationalNumber:root.x], [MathToolsBasic stringFromDoubleWithDefaultAccuracy:root.x.doubleValue()]];
        else
            rootString = [NSString stringWithFormat: @"x ≈ %@", [MathToolsBasic stringFromDoubleWithDefaultAccuracy:root.x.doubleValue()]];
        rootLabel.text = rootString;
    }
    else
        [self.alert show];
}

- (IBAction)clearAll
{
    for (int i = kATextTag; i <= kCTextTag; i ++)
        ((UITextField *)[self.view viewWithTag:i]).text = @"";
    ((UILabel *)[self.view viewWithTag:kRootTag]).text = @"";
}

@end
