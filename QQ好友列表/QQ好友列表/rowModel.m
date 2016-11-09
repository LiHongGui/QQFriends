//
//  rowModel.m
//  QQ好友列表
//
//  Created by lihonggui on 2016/11/8.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "rowModel.h"

@implementation rowModel

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}



-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return  self;
}

+(instancetype)rowModelWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
