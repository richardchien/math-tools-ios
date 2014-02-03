//
//  RCLine1ViewController.m
//  MathTools
//
//  Created by Richard Chien on 14-1-30.
//  Copyright (c) 2014年 Richard Chien. All rights reserved.
//

#import "RCLine1ViewController.h"

@interface RCLine1ViewController ()

@end

@implementation RCLine1ViewController

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
    UITextField *x1Text = (UITextField *)[self.view viewWithTag:kX1TextTag];
    UITextField *y1Text = (UITextField *)[self.view viewWithTag:kY1TextTag];
    UITextField *x2Text = (UITextField *)[self.view viewWithTag:kX2TextTag];
    UITextField *y2Text = (UITextField *)[self.view viewWithTag:kY2TextTag];
    UILabel *resultLabel = (UILabel *)[self.view viewWithTag:kResultTag];
    
    [[self findFirstReponder] resignFirstResponder];
    resultLabel.text = @"";
    
    if (![x1Text.text isEqualToString:@""] &&
        ![y1Text.text isEqualToString:@""] &&
        ![x2Text.text isEqualToString:@""] &&
        ![y2Text.text isEqualToString:@""] &&
        !([x1Text.text isEqualToString:x2Text.text] && [y1Text.text isEqualToString:y2Text.text])) {
        
        RCPoint M, N;
        M.x = frac(x1Text.text.doubleValue);
        M.y = frac(y1Text.text.doubleValue);
        N.x = frac(x2Text.text.doubleValue);
        N.y = frac(y2Text.text.doubleValue);
        
        Line result = LineWithTwoPoint(M, N);
        NSString *resultString;
        if (result.A == 0)
            resultString = [NSString stringWithFormat:@"y = %@", [MathToolsBasic stringFromRationalNumber:result.C.changeSign() / result.B]];
        else if (result.B == 0)
            resultString = [NSString stringWithFormat:@"x = %@", [MathToolsBasic stringFromRationalNumber:result.C.changeSign() / result.A]];
        else if (result.C == 0)
            resultString = [NSString stringWithFormat:@"%@x %s %@y = 0",
                            [MathToolsBasic stringFromRationalNumber:result.A],
                            result.B > 0 ? "+" : "-",
                            [MathToolsBasic stringFromRationalNumber:(result.B > 0 ? result.B : result.B.changeSign())]];
        else
            resultString = [NSString stringWithFormat:@"%@x %s %@y %s %@ = 0",
                            [MathToolsBasic stringFromRationalNumber:result.A],
                            result.B > 0 ? "+" : "-",
                            [MathToolsBasic stringFromRationalNumber:(result.B > 0 ? result.B : result.B.changeSign())],
                            result.C > 0 ? "+" : "-",
                            [MathToolsBasic stringFromRationalNumber:(result.C > 0 ? result.C : result.C.changeSign())]];
        
        resultLabel.text = resultString;
    }
    else
        [self.alert show];
}

- (IBAction)clearAll
{
    for (int i = kX1TextTag; i <= kY2TextTag; i ++)
        ((UITextField *)[self.view viewWithTag:i]).text = @"";
    ((UILabel *)[self.view viewWithTag:kResultTag]).text = @"";
}

@end
