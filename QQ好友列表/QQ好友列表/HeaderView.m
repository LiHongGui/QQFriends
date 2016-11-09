//
//  HeaderView.m
//  QQ好友列表
//
//  Created by lihonggui on 2016/11/9.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "HeaderView.h"
#import "GroupsModel.h"
@interface HeaderView()
@property(nonatomic,weak) UIButton *button;
@property(nonatomic,weak) UILabel *label;
@property(nonatomic,weak) UIImage *image;
@end
@implementation HeaderView

//重写
-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self  = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self setupHeaderViewUI];
    }
    return self;
}
#pragma mark -
#pragma mark -  当view的frame 发生改变的时候就会调用
-(void)layoutSubviews
{
    [super layoutSubviews];
    [self setupHeaderViewFrame];
}

-(void)setupHeaderViewFrame
{
    _button.frame = self.contentView.bounds;
    CGFloat labelWidth = 60;
        CGFloat labelX = self.contentView.frame.size.width - labelWidth;
        CGFloat labelY = 0;
    //    #warning label的高度要和header的高度一样,否则无法label文本无法显示居中
    self.label.frame = CGRectMake(labelX, labelY, labelWidth, self.contentView.frame.size.height);
}
-(void)setupHeaderViewUI
{
    UIButton *button = [[UIButton alloc]init];
    self.button = button;
        [button setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
        //button的image
        [button setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //设置button上的空间靠左
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        button.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
        //旋转后内容大小一样
        button.imageView.contentMode = UIViewContentModeCenter;
        //超出后不切边
        button.imageView.clipsToBounds = NO;
    
        //添加点击事件:点击时,图标变换
    [button addTarget:self action:@selector(didClickButton:) forControlEvents:UIControlEventTouchUpInside];
        //button的title
        UILabel *label = [[UILabel alloc]init];
        self.label = label;
        label.textAlignment = NSTextAlignmentCenter;
        [button addSubview:label];
        [self.contentView addSubview:button];
}

-(void)didClickButton:(UIButton *)button
{
    #warning 通知代理
    if ([self.delegate respondsToSelector:@selector(HeaderView:andDidClickButton:)]) {
        [self.delegate HeaderView:self andDidClickButton:button];
    }
}
-(void)setRotateImage:(BOOL)rotateImage
{
    if (rotateImage) {
        
        self.button.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }else
    {
        self.button.imageView.transform = CGAffineTransformIdentity;
    }
    
}
//重写
-(void)setModel:(GroupsModel *)model
{
    _model = model;
    [_button setTitle:model.name forState:UIControlStateNormal];
    _label.text = [NSString stringWithFormat:@"%@/%lu",_model.online,(unsigned long)_model.friends.count];
}
@end
