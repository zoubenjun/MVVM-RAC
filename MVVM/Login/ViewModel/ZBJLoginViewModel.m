//
//  ZBJLoginViewModel.m
//  MVVM
//
//  Created by zoubenjun on 2020/11/20.
//

#import "ZBJLoginViewModel.h"

@implementation ZBJLoginViewModel

- (instancetype)init {
    if (self = [super init]) {
        [self setup];
    }
    return self;
}

- (void)setup {
    _loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        // block调用：执行命令就会调用
        // block作用：事件处理
        // 发送登录请求
        NSLog(@"发送登录请求");
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)),dispatch_get_main_queue(), ^{
                // 发送数据
                [subscriber sendNext:@"发送登录的数据"];
                [subscriber sendCompleted]; // 一定要记得写
            });
            
            return nil;
        }];
    }];

    // 创建登录命令
    // 获取命令中的信号源
    [_loginCommand.executionSignals.switchToLatest subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];
    
    [[_loginCommand.executing skip:1] subscribeNext:^(id x) { // 跳过第一步（"没有执行"这步）
        if ([x boolValue] == YES) {
            NSLog(@"--正在执行");
            // 显示蒙版
        }else { //执行完成
            NSLog(@"执行完成");
            // 取消蒙版
        }
    }];
}

@end
