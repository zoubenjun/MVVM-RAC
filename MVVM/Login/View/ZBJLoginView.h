//
//  ZBJLoginView.h
//  MVVM
//
//  Created by zoubenjun on 2020/11/20.
//

#import <UIKit/UIKit.h>
#import "ZBJLoginViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZBJLoginView : UIView

@property (nonatomic, strong) UITextField *nameTextField;
@property (nonatomic, strong) UITextField *psdTextField;
@property (nonatomic, strong) UIButton *loginButton;

@property (nonatomic, strong) ZBJLoginViewModel *loginVM;

- (instancetype)initWithFrame:(CGRect)frame;

@end

NS_ASSUME_NONNULL_END
