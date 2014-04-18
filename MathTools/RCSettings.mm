//
//  RCSettings.m
//  MathTools
//
//  Created by Richard Chien on 14-1-31.
//  Copyright (c) 2014年 Richard Chien. All rights reserved.
//

#import "RCSettings.h"
#import "MathToolsBasic.h"

@interface RCSettings ()

@end

@implementation RCSettings

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
    _accuracyLabel.text = [NSString stringWithFormat:@"%d", (int)[MathToolsBasic preferenceAccuracy]];
    _accuracyStepper.value = [MathToolsBasic preferenceAccuracy];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeAccuracy:(UIStepper *)sender
{
    [MathToolsBasic setPreferenceAccuracy:sender.value];
    _accuracyLabel.text = [NSString stringWithFormat:@"%d", (int)[MathToolsBasic preferenceAccuracy]];
}

- (void)provideFeedback
{
    try {
        MFMailComposeViewController *mailController = [[MFMailComposeViewController alloc] init];
        mailController.mailComposeDelegate = self;
        [mailController setSubject:@"数学小工具 意见反馈"];
        [mailController setToRecipients:[NSArray arrayWithObject:@"richardchien.me@gmail.com"]];
        [self presentViewController:mailController animated:YES completion:nil];
    }
    catch(NSException *ex) {
        
    }
}

#pragma mark - Table View Delegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView cellForRowAtIndexPath:indexPath].tag == kFeedbackCellTag) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        [self provideFeedback];
    }
}

#pragma mark - Mail Delegate

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
