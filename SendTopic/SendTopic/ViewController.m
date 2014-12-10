//
//  ViewController.m
//  SendTopic
//
//  Created by iwind on 14-12-8.
//  Copyright (c) 2014年 iwind. All rights reserved.
//

#import "ViewController.h"
#import "UserLocationViewController.h"
@interface ViewController () <UITextViewDelegate>

@property (nonatomic,strong) UITextView *tv;
@property (nonatomic,strong) UILabel *titleLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tv = [[UITextView alloc]initWithFrame:CGRectMake(20,20,280, 200)];
    self.tv.backgroundColor = [UIColor whiteColor];
//    tv.borderStyle = UITextBorderStyleRoundedRect;
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    
    self.tv.delegate = self;
    [self.view addSubview:self.tv];
    //截取按钮
    UIButton * cutBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 260, 150, 40)];
    cutBtn.backgroundColor = [UIColor redColor];
    [cutBtn setTitle:@"释放第一响应者" forState:UIControlStateNormal];
    [cutBtn addTarget:self action:@selector(cutString) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cutBtn];
    //添加位置
    UIButton * addLocationBtn = [[UIButton alloc]initWithFrame:CGRectMake(180, 260, 80, 40)];
    addLocationBtn.backgroundColor = [UIColor blueColor];
    [addLocationBtn setTitle:@"添加位置" forState:UIControlStateNormal];
    [addLocationBtn addTarget:self action:@selector(addLocation) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addLocationBtn];
    //title Label
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 300, [[UIScreen mainScreen] bounds].size.width-40, 40)];
    self.titleLabel.backgroundColor = [UIColor greenColor];
    [self.view addSubview: self.titleLabel];
    
    
    
//    [self.tv shouldChangeTextInRange:[NSMakeRange(0, 200)] replacementText:self.tv.text];
    
}

- (void)cutString{
    [self.tv resignFirstResponder];
    
}

- (void)addLocation{
    UserLocationViewController * userLocationVC = [[UserLocationViewController alloc]init];
    [self presentViewController:userLocationVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
static int flag = 0;
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
//    NSLog(@"textview协议方法");
    if ([text isEqualToString:@"\n"]&&flag==0) {
        flag ++;
        self.titleLabel.text = self.tv.text;
        return NO;
    }
    return YES;
}



@end
