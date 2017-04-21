//
//  ViewController.m
//  AttributedStringTest
//
//  Created by yinbake on 2017/4/20.
//  Copyright © 2017年 yinbake. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupUI];
}

- (void)setupUI
{
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 200, 30)];
    label1.backgroundColor = [UIColor yellowColor];
    label1.attributedText = [self attachImage:[UIImage imageNamed:@"笑哭了"] atTheEndOfString:@"单行末尾加图片"];
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(100, 300, 200, 60)];
    label2.backgroundColor = [UIColor greenColor];
    label2.attributedText = [self attachImage:[UIImage imageNamed:@"笑哭了"] atTheEndOfString:@"多行末尾加图片多行末尾加图片"];
    label2.numberOfLines = 0;
    
    [self.view addSubview:label1];
    [self.view addSubview:label2];
    
}

- (NSAttributedString *)attachImage: (UIImage *)iamge atTheEndOfString: (NSString *)string
{
    NSMutableAttributedString *mAttriStr = [[NSMutableAttributedString alloc]initWithString:string];
    
    NSTextAttachment *imageAttach = [[NSTextAttachment alloc]init];
    imageAttach.image = iamge;
    imageAttach.bounds = CGRectMake(4, -4, 20, 20);
    
    NSAttributedString *attriStr = [NSAttributedString attributedStringWithAttachment:imageAttach];
    
    [mAttriStr appendAttributedString:attriStr];
    
    return [[NSAttributedString alloc]initWithAttributedString:mAttriStr];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
