//
//  ZBJLoginViewModel.h
//  MVVM
//
//  Created by zoubenjun on 2020/11/20.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC.h>
#import "ZBJLoginModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZBJLoginViewModel : NSObject

@property (nonatomic, strong) ZBJLoginModel *loginModel;

@property (nonatomic, strong, readonly) RACCommand *loginCommand;


@end

NS_ASSUME_NONNULL_END
