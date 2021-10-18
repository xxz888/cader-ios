//
//  main.m
//  MCExample
//
//  Created by wza on 2020/7/2.
//  Copyright © 2020 MingChe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <OEMSDK/Application_TimeOut.h>
int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }

    return UIApplicationMain(argc, argv, NSStringFromClass([Application_TimeOut class]), appDelegateClassName);
}
