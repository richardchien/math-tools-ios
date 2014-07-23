//
//  RCAbout.m
//  MathTools
//
//  Created by Richard Chien on 14-1-31.
//  Copyright (c) 2014年 Richard Chien. All rights reserved.
//

#import "RCAbout.h"

@interface RCAbout ()

@end

@implementation RCAbout

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
    UITextView *textView = (UITextView *)[self.view viewWithTag:kTextViewTag];
    textView.text = @"这是一款面向初、高中生的工具类应用，提供一些基础计算功能，可以帮您在解决大量数学题时节省一些宝贵时间。但切记不要过度依赖，一定要在保证自己知道解法的情况下再使用本应用哦！\r\r注意事项：\n1、必须把每个横线都填了才能求解；\r2、除了“三角函数”之外其它工具中，输入的数字的小数位数小于等于6位才保证准确；\r3、“求椭圆或双曲线”中只能求得以原点为中心的；\r4、输入的数字如果大的离谱而导致结果不准确的话，敬请谅解；\r\r如果有任何意见或建议，请在前一个页面上向我提供意见反馈。\r\r谢谢使用！";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
