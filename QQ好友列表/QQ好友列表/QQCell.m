//
//  QQCell.m
//  QQ好友列表
//
//  Created by lihonggui on 2016/11/8.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "QQCell.h"
#import "rowModel.h"
@implementation QQCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setModel:(rowModel *)model
{
    _model = model;
    self.imageView.image = [UIImage imageNamed:model.icon];
    self.detailTextLabel.text = model.intro;
    self.textLabel.text= model.name;
    //如果是会员,显示红色
    if (model.vip == 1) {
        [self.textLabel setTextColor:[UIColor redColor]];
    }else
    {
        [self.textLabel setTextColor:[UIColor blackColor]];
    }
}
@end
