//
//  HeaderView.h
//  QQ好友列表
//
//  Created by lihonggui on 2016/11/9.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GroupsModel,HeaderView;

@protocol HeaderViewDelegate <NSObject>
#warning 设置代理方法
-(void)HeaderView:(HeaderView *)headerModel andDidClickButton:(UIButton *)button;

@end
@interface HeaderView : UITableViewHeaderFooterView
@property(nonatomic,strong) GroupsModel *model;
-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier;
#warning 设置代理协议,只要是遵守我的代理方法的都可以调用
@property(nonatomic,weak) id<HeaderViewDelegate> delegate;

//设置属性:旋转
@property(nonatomic,assign) BOOL  rotateImage;
@end
