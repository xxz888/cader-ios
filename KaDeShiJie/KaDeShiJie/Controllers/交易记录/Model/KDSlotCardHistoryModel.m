//
//  KDSlotCardHistoryModel.m
//  KaDeShiJie
//
//  Created by SS001 on 2020/9/25.
//  Copyright © 2020 SS001. All rights reserved.
//

#import "KDSlotCardHistoryModel.h"

@implementation KDSlotCardHistoryModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
     return @{
              @"itemId" : @"id",
             };
}
@end
