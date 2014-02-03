//
//  RCCE1ViewController.m
//  MathTools
//
//  Created by Richard Chien on 14-1-30.
//  Copyright (c) 2014年 Richard Chien. All rights reserved.
//

#import "RCCE1ViewController.h"

@interface RCCE1ViewController ()

@end

@implementation RCCE1ViewController

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

- (NSString *)makeRootString:(ComplexNumber)root :(NSString *)rootName
{
    NSString *result;
    
    if (fabs(root.real - 0) <= 0.0000001) {
        if (root.imaginary == 0)
            result = [NSString stringWithFormat: @"%@ = 0", rootName];
        else
            result = [NSString stringWithFormat: @"%@ = %@i", rootName, [MathToolsBasic stringFromDoubleWithDefaultAccuracy:root.imaginary]];
    }
    else {
        if (root.imaginary == 0)
            result = [NSString stringWithFormat: @"%@ = %@", rootName, [MathToolsBasic stringFromDoubleWithDefaultAccuracy:root.real]];
        else {
            if (root.imaginary > 0)
                result = [NSString stringWithFormat: @"%@ = %@ + %@i", rootName, [MathToolsBasic stringFromDoubleWithDefaultAccuracy:root.real], [MathToolsBasic stringFromDoubleWithDefaultAccuracy:root.imaginary]];
            else
                result = [NSString stringWithFormat: @"%@ = %@ - %@i", rootName, [MathToolsBasic stringFromDoubleWithDefaultAccuracy:root.real], [MathToolsBasic stringFromDoubleWithDefaultAccuracy:-root.imaginary]];
        }
    }
    
    return result;
}

- (IBAction)solve
{
    UITextField *aText = (UITextField *)[self.view viewWithTag:kATextTag];
    UITextField *bText = (UITextField *)[self.view viewWithTag:kBTextTag];
    UITextField *cText = (UITextField *)[self.view viewWithTag:kCTextTag];
    UITextField *dText = (UITextField *)[self.view viewWithTag:kDTextTag];
    UILabel *rootLabel1 = (UILabel *)[self.view viewWithTag:kRoot1Tag];
    UILabel *rootLabel2 = (UILabel *)[self.view viewWithTag:kRoot2Tag];
    UILabel *rootLabel3 = (UILabel *)[self.view viewWithTag:kRoot3Tag];
    
    [[self findFirstReponder] resignFirstResponder];
    rootLabel1.text = @"";
    rootLabel2.text = @"";
    rootLabel3.text = @"";
    
    if (aText.text.doubleValue != 0 && bText.text.doubleValue != 0 && cText.text.doubleValue != 0 && ![dText.text isEqualToString: @""]) {
        CubicEquaRt root = solveCubicEquation(aText.text.doubleValue, bText.text.doubleValue, cText.text.doubleValue, dText.text.doubleValue);
        
        NSString *rootString1 = [self makeRootString: root.x1 : @"x1"];
        NSString *rootString2 = [self makeRootString: root.x2 : @"x2"];
        NSString *rootString3 = [self makeRootString: root.x3 : @"x3"];
        rootLabel1.text = rootString1;
        rootLabel2.text = rootString2;
        rootLabel3.text = rootString3;
    }
    else
        [self.alert show];
}

- (IBAction)clearAll
{
    for (int i = kATextTag; i <= kDTextTag; i ++)
        ((UITextField *)[self.view viewWithTag:i]).text = @"";
    for (int i = kRoot1Tag; i <= kRoot3Tag; i ++)
        ((UILabel *)[self.view viewWithTag:i]).text = @"";
}

@end
