//
//  GroupsModel.h
//  QQ好友列表
//
//  Created by lihonggui on 2016/11/8.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupsModel : NSObject
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *online;

@property(nonatomic,strong) NSArray *friends;
@property(nonatomic,assign,getter=show) BOOL isShow;
-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)groupsFriendsWithDict:(NSDictionary *)dict;
@end
