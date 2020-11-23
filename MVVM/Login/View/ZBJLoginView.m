//
//  ZBJLoginView.m
//  MVVM
//
//  Created by zoubenjun on 2020/11/20.
//

#import "ZBJLoginView.h"
#import <ReactiveObjC.h>

@interface ZBJLoginView()

@end

@implementation ZBJLoginView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(16, 0, 200, 50)];
        _nameTextField.placeholder = @"input name";
        [self addSubview:_nameTextField];
        _psdTextField = [[UITextField alloc] initWithFrame:CGRectMake(16, 50, 200, 50)];
        _psdTextField.placeholder = @"input password";
        [self addSubview:_psdTextField];
        _loginButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 100, 50)];
        [_loginButton setTitle:@"Login" forState:UIControlStateNormal];
        [_loginButton setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        [self addSubview:_loginButton];
    }
    
    return self;
}

- (void)setLoginVM:(ZBJLoginViewModel *)loginVM {
    
    if (!loginVM) {
        return;
    }
    _loginVM = loginVM;
    
    self.nameTextField.text = loginVM.loginModel.name;
    self.psdTextField.text = loginVM.loginModel.password;
    
//    [self.nameTextField.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
//        NSLog(@"%@", x);
//    }];
    
//    RACSignal *nameSignal = self.nameTextField.rac_textSignal;
//    RACSignal *fliterNameSignal = [nameSignal filter:^BOOL(id  _Nullable value) {
//        NSString *text = value;
//        return text.length > 3;
//    }];
//    [fliterNameSignal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"%@", x);
//    }];
    
//    [[[self.nameTextField.rac_textSignal map:^id _Nullable(NSString * _Nullable value) {
//        return @(value.length);
//    }] filter:^BOOL(id  _Nullable value) {
//        return [value integerValue] > 3;
//    }] subscribeNext:^(id  _Nullable x) {
//        NSLog(@"%@", x);
//    }];

//    [[self.nameTextField.rac_textSignal filter:^BOOL(NSString * _Nullable value) {
//        return value.length > 3;
//    }] subscribeNext:^(NSString * _Nullable x) {
//        NSLog(@"%@", x);
//    }];
    
//    [[[self.nameTextField.rac_textSignal map:^id _Nullable(NSString * _Nullable value) {
//        return @(value.length > 3);
//    }] map:^id _Nullable(id  _Nullable value) {
//        return [value integerValue] > 0 ? [UIColor grayColor] : [UIColor blueColor];
//    }] subscribeNext:^(UIColor *color) {
//        self.nameTextField.backgroundColor = color;
//    }];
    
//    [[[self.loginButton rac_signalForControlEvents:UIControlEventTouchUpInside] flattenMap:^id _Nullable(__kindof UIControl * _Nullable value) {
//            return [self signInSingal];
//    }] subscribeNext:^(id  _Nullable x) {
//
//    }];
    
//    RACSignal *nameValiedSingal = [self.nameTextField.rac_textSignal map:^id _Nullable(NSString * _Nullable value) {
//        return @(value.length > 3);
//    }];
//    RACSignal *psdValiedSingal = [self.psdTextField.rac_textSignal map:^id _Nullable(NSString * _Nullable value) {
//        return @(value.length > 4);
//    }];
//    
//    RAC(self.nameTextField, backgroundColor) = [nameValiedSingal map:^id _Nullable(id  _Nullable value) {
//        return [value integerValue] > 0 ? [UIColor yellowColor] : [UIColor whiteColor];
//    }];
//    RAC(self.psdTextField, backgroundColor) = [psdValiedSingal map:^id _Nullable(id  _Nullable value) {
//        return [value integerValue] > 0 ? [UIColor yellowColor] : [UIColor whiteColor];
//    }];
//    
//    RAC(self.loginButton, enabled) = [RACSignal combineLatest:@[nameValiedSingal, psdValiedSingal] reduce:^id _Nullable(NSNumber *account, NSNumber *psd) {
//        return @([account boolValue] && [psd boolValue]);
//    }];
//
//    [[[self.loginButton rac_signalForControlEvents:(UIControlEventTouchUpInside)] doNext:^(__kindof UIControl * _Nullable x) {
//        self.loginButton.enabled = NO;
//    }] subscribeNext:^(__kindof UIControl * _Nullable x) {
//        [loginVM.loginCommand execute:nil];
//    }];
}

@end
