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
    @try {
        MFMailComposeViewController *mailController = [[MFMailComposeViewController alloc] init];
        mailController.mailComposeDelegate = self;
        [mailController setSubject:@"数学小工具 意见反馈"];
        [mailController setToRecipients:[NSArray arrayWithObject:@"feedback@r-c.im"]];
        [self presentViewController:mailController animated:YES completion:nil];
    }
    @catch(NSException *ex) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"操作失败"
                                                        message:@"您的系统中没有设置邮件地址，暂时无法发送意见反馈。请在系统中添加邮件地址后再试。"
                                                       delegate:nil
                                              cancelButtonTitle:@"知道了"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (void)rateOnAppStore
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/us/app/shu-xue-xiao-gong-ju/id710500795?ls=1&mt=8"]];
}

#pragma mark - Table View Delegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([tableView cellForRowAtIndexPath:indexPath].tag == kFeedbackCellTag) {
        [self provideFeedback];
    }
    else if ([tableView cellForRowAtIndexPath:indexPath].tag == kRateCellTag) {
        [self rateOnAppStore];
    }
}

#pragma mark - Mail Delegate

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [controller dismissViewControllerAnimated:YES completion:nil];
}

@end
