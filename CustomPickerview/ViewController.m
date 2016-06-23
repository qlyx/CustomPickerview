//
//  ViewController.m
//  CustomPickerview
//
//  Created by 主用户 on 16/4/15.
//  Copyright © 2016年 江萧. All rights reserved.
//

#import "ViewController.h"
#import "JXAlertview.h"
#import "CustomDatePicker.h"
@interface ViewController ()<CustomAlertDelegete>
{
    CustomDatePicker *Dpicker;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //闰年非闰年都做了判断 年份取得是当前年份的前后三十年，大家也可自行按照自己需求自行修改
    Dpicker = [[CustomDatePicker alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width-20, 200)];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    JXAlertview *alert = [[JXAlertview alloc] initWithFrame:CGRectMake(10, (self.view.frame.size.height-260)/2, self.view.frame.size.width-20, 260)];
    //alert.image = [UIImage imageNamed:@"dikuang"];
    alert.delegate = self;
    [alert initwithtitle:@"请选择日期" andmessage:@"" andcancelbtn:@"取消" andotherbtn:@"确定"];
    
    //我把Dpicker添加到一个弹出框上展现出来 当然大家还是可以以任何其他动画形式展现
    [alert addSubview:Dpicker];
    [alert show];
    return NO;
}
-(void)btnindex:(int)index :(int)tag
{
    if (index == 2) {
        self.tf_text.text = [NSString stringWithFormat:@"%d年%d月%d日",Dpicker.year,Dpicker.month,Dpicker.day];
        [self.tf_text resignFirstResponder];
    }
}
@end
