//
//  RCQE1ViewController.m
//  MathTools
//
//  Created by Richard Chien on 14-1-30.
//  Copyright (c) 2014年 Richard Chien. All rights reserved.
//

#import "RCQE1ViewController.h"

@interface RCQE1ViewController ()

@end

@implementation RCQE1ViewController

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
    UILabel *rootLabel1 = (UILabel *)[self.view viewWithTag:kRoot1Tag];
    UILabel *rootLabel2 = (UILabel *)[self.view viewWithTag:kRoot2Tag];
    
    [[self findFirstReponder] resignFirstResponder];
    rootLabel1.text = @"";
    rootLabel2.text = @"";
    
    if (aText.text.doubleValue != 0 && ![bText.text isEqualToString: @""] && ![cText.text isEqualToString: @""]) {
        QuadEquaRt root = solveQuadraticEquation(frac(aText.text.doubleValue), frac(bText.text.doubleValue), frac(cText.text.doubleValue));
        if (root.hasRealRoots == false) {
            NSString *string = @"此方程无实数根";
            rootLabel1.text = string;
        }
        else {
            NSString *rootString1;
            NSString *rootString2;
            
            if ([MathToolsBasic stringFromQuadraticIrrational:root.x1].length <= kLineMaxChar &&
                [MathToolsBasic stringFromQuadraticIrrational:root.x2].length <= kLineMaxChar)
            {
                rootString1 = [NSString stringWithFormat: @"x1 = %@\n≈ %@", [MathToolsBasic stringFromQuadraticIrrational:root.x1], [MathToolsBasic stringFromDoubleWithDefaultAccuracy:root.x1.doubleValue()]];
                rootString2 = [NSString stringWithFormat: @"x2 = %@\n≈ %@", [MathToolsBasic stringFromQuadraticIrrational:root.x2], [MathToolsBasic stringFromDoubleWithDefaultAccuracy:root.x2.doubleValue()]];
            }
            else {
                rootString1 = [NSString stringWithFormat: @"x1 ≈ %@", [MathToolsBasic stringFromDoubleWithDefaultAccuracy:root.x1.doubleValue()]];
                rootString2 = [NSString stringWithFormat: @"x2 ≈ %@", [MathToolsBasic stringFromDoubleWithDefaultAccuracy:root.x2.doubleValue()]];
            }
            rootLabel1.text = rootString1;
            rootLabel2.text = rootString2;
        }
    }
    else {
        [self.alert show];
    }
}

- (IBAction)clearAll
{
    for (int i = kATextTag; i <= kCTextTag; i ++)
        ((UITextField *)[self.view viewWithTag:i]).text = @"";
    for (int i = kRoot1Tag; i <= kRoot2Tag; i ++)
        ((UILabel *)[self.view viewWithTag:i]).text = @"";
}

@end
