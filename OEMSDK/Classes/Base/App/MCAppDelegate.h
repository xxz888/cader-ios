//
//  MCAppDelegate.h
//  MCOEM
//
//  Created by wza on 2020/6/29.
//  Copyright © 2020 MingChe. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MCAppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;


/// 子类重写，在此进行app配置
- (void)setupApp;

@end

NS_ASSUME_NONNULL_END
