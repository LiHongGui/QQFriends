//
//  rowModel.h
//  QQ好友列表
//
//  Created by lihonggui on 2016/11/8.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface rowModel : NSObject

@property(nonatomic,copy) NSString *icon;
@property(nonatomic,copy) NSString *intro;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,assign) NSInteger vip;


-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)rowModelWithDict:(NSDictionary *)dict;
@end
