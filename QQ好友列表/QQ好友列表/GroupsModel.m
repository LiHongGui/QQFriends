//
//  GroupsModel.m
//  QQ好友列表
//
//  Created by lihonggui on 2016/11/8.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "GroupsModel.h"
#import "rowModel.h"
@implementation GroupsModel

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
         [self setValuesForKeysWithDictionary:dict];
        NSMutableArray *mutb = [NSMutableArray array];
        for (NSDictionary *dict in self.friends) {
            rowModel *model = [rowModel rowModelWithDict:dict];
            
            [mutb addObject:model];
        }
        self.friends = mutb;
    }

    return self;
}

+(instancetype)groupsFriendsWithDict:(NSDictionary *)dict
{
    return  [[self alloc]initWithDict:dict];
}
@end
