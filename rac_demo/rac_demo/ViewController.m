//
//  ViewController.m
//  rac_demo
//
//  Created by 李凯 on 2018/12/21.
//  Copyright © 2018年 LK. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "LKSimulatedNetworkService.h"
#import "LKSuccessViewController.h"

#define kDefaultLeftMargin 40
#define kDefaultRightMargin -80
#define kTextFieldDefultHeight 30

@interface ViewController ()

@property (nonatomic, strong) UITextField *userNameTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UIButton *signInButton;

@property (nonatomic, assign) BOOL userNameIsValid;
@property (nonatomic, assign) BOOL passwordIsValid;

@property (nonatomic, strong) LKSimulatedNetworkService *networkService;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initValues];
    [self initSubviews];
}

- (void)initValues {
    self.title = @"Sign In";
    self.signInButton.enabled = NO;
    self.networkService = [[LKSimulatedNetworkService alloc]init];
}

- (void)initSubviews {
    [self.view addSubview:self.userNameTextField];
    [self.view addSubview:self.passwordTextField];
    [self.view addSubview:self.signInButton];
}

- (void)viewDidLayoutSubviews {
    [self.userNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(kDefaultLeftMargin);
        make.right.equalTo(self.view).offset(kDefaultRightMargin);
        make.top.equalTo(self.view).offset(120);
        make.height.offset(kTextFieldDefultHeight);
    }];
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.equalTo(self.userNameTextField);
        make.top.equalTo(self.userNameTextField.mas_bottom).offset(30);
    }];
    [self.signInButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-40);
        make.top.equalTo(self.view).offset(240);
    }];
}

- (void)userNameTextFieldChanged: (UITextField *)sender {
    self.userNameIsValid = sender.text.length > 2 ? YES : NO;
    [self updateUIState];
}

- (void)passwordTextFieldChanged: (UITextField *)sender {
    self.passwordIsValid = sender.text.length > 5 ? YES : NO;
    [self updateUIState];
}

- (void)updateUIState {
    self.userNameTextField.backgroundColor = self.userNameIsValid ? [UIColor yellowColor] : [UIColor whiteColor];
    self.passwordTextField.backgroundColor = self.passwordIsValid ? [UIColor yellowColor] : [UIColor whiteColor];
    self.signInButton.enabled = self.userNameIsValid && self.passwordIsValid;
}

- (void)signInButtonClicked: (UIButton *)sender {
    self.signInButton.enabled = NO;
    [self.networkService signInWithUserName:self.userNameTextField.text password:self.passwordTextField.text complete:^(BOOL success) {
        self.signInButton.enabled = YES;
        if (success) {
            [self.navigationController pushViewController:[LKSuccessViewController new] animated:YES];
        }else{
            NSLog(@"用户名/密码错误");
        }
    }];
}

- (UITextField *)userNameTextField {
    if (!_userNameTextField) {
        _userNameTextField = [[UITextField alloc]init];
        _userNameTextField.placeholder = @" enter userName...";
        [_userNameTextField addTarget:self action:@selector(userNameTextFieldChanged:) forControlEvents:UIControlEventEditingChanged];
        _userNameTextField.layer.cornerRadius = 3.0;
        _userNameTextField.layer.masksToBounds = YES;
        _userNameTextField.layer.borderWidth = 1.0;
        _userNameTextField.layer.borderColor = [UIColor grayColor].CGColor;
    }
    return _userNameTextField;
}

- (UITextField *)passwordTextField {
    if (!_passwordTextField) {
        _passwordTextField = [[UITextField alloc]init];
        _passwordTextField.placeholder = @" enter password...";
        [_passwordTextField addTarget:self action:@selector(passwordTextFieldChanged:) forControlEvents:UIControlEventEditingChanged];
        _passwordTextField.layer.cornerRadius = 3.0;
        _passwordTextField.layer.masksToBounds = YES;
        _passwordTextField.layer.borderWidth = 1.0;
        _passwordTextField.layer.borderColor = [UIColor grayColor].CGColor;
    }
    return _passwordTextField;
}

- (UIButton *)signInButton {
    if (!_signInButton) {
        _signInButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_signInButton sizeToFit];
        [_signInButton setTitle:@"Sign In" forState:UIControlStateNormal];
        [_signInButton addTarget:self action:@selector(signInButtonClicked:) forControlEvents: UIControlEventTouchUpInside];
        [_signInButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _signInButton;
}


@end
