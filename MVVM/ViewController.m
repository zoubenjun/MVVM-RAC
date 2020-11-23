//
//  ViewController.m
//  MVVM
//
//  Created by zoubenjun on 2020/11/20.
//

#import "ViewController.h"
#import "ZBJLoginViewController.h"
#import <ReactiveObjC.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 50, 50);
    [button setTitle:@"login" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor yellowColor];
    @weakify(self);
    [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        ZBJLoginViewController *vc = [[ZBJLoginViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }];
    [self.view addSubview:button];
    
    [self test];
}

- (void)test // 普通写法, 这样的缺点是：没订阅一次信号就得重新创建并发送请求，这样很不友好
{
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        // didSubscribeblock中的代码都统称为副作用。
        // 发送请求---比如afn
        NSLog(@"发送请求啦");
        // 发送信号
        [subscriber sendNext:@"ws"];
        return nil;
    }];
    
    RACMulticastConnection *connection = [signal publish];
    [connection.signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@", x);
    }];
    [connection.signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@", x);
    }];
    [connection.signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@", x);
    }];
    [connection connect];
}

@end
