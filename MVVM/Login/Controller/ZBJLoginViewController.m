//
//  ZBJLoginViewController.m
//  MVVM
//
//  Created by zoubenjun on 2020/11/20.
//

#define ZBJ_LAZY(object, assignment) (object = object ? : assignment)

#import "ZBJLoginViewController.h"
#import <ReactiveObjC.h>
#import "ZBJLoginView.h"
#import "ZBJLoginViewModel.h"

@interface ZBJLoginViewController ()

@property (nonatomic, strong) ZBJLoginView *loginView;
@property (nonatomic, strong) ZBJLoginViewModel *loginVM;

@end

@implementation ZBJLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self bindViewModel];
    [self events];
}

- (void)bindViewModel {
    RAC(self.loginView, loginVM) = RACObserve(self, loginVM);
}

- (void)events {
    RACSignal *nameValiedSingal = [self.loginView.nameTextField.rac_textSignal map:^id _Nullable(NSString * _Nullable value) {
        return @(value.length > 3);
    }];
    [nameValiedSingal distinctUntilChanged];
    RACSignal *psdValiedSingal = [self.loginView.psdTextField.rac_textSignal map:^id _Nullable(NSString * _Nullable value) {
        return @(value.length > 4);
    }];
    
    RAC(self.loginView.nameTextField, backgroundColor) = [nameValiedSingal map:^id _Nullable(id  _Nullable value) {
        return [value integerValue] > 0 ? [UIColor yellowColor] : [UIColor whiteColor];
    }];
    RAC(self.loginView.psdTextField, backgroundColor) = [psdValiedSingal map:^id _Nullable(id  _Nullable value) {
        return [value integerValue] > 0 ? [UIColor yellowColor] : [UIColor whiteColor];
    }];
    
    RAC(self.loginView.loginButton, enabled) = [RACSignal combineLatest:@[nameValiedSingal, psdValiedSingal] reduce:^id _Nullable(NSNumber *account, NSNumber *psd) {
        return @([account boolValue] && [psd boolValue]);
    }];

    [[[self.loginView.loginButton rac_signalForControlEvents:(UIControlEventTouchUpInside)] doNext:^(__kindof UIControl * _Nullable x) {
        self.loginView.loginButton.enabled = NO;
    }] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [self.loginVM.loginCommand execute:nil];
    }];
}

- (ZBJLoginView *)loginView {
    return ZBJ_LAZY(_loginView, ({
        ZBJLoginView *view = [[ZBJLoginView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 200)];
        [self.view addSubview:view];
        view;
    }));
}
- (ZBJLoginViewModel *)loginVM {
    return ZBJ_LAZY(_loginVM, ({
        [[ZBJLoginViewModel alloc] init];
    }));
}

@end
