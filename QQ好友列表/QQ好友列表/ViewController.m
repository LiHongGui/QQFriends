//
//  ViewController.m
//  QQ好友列表
//
//  Created by lihonggui on 2016/11/8.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "ViewController.h"
#import "QQCell.h"
#import "GroupsModel.h"
#import "rowModel.h"
#import "HeaderView.h"
@interface ViewController ()<HeaderViewDelegate>

@property(nonatomic,strong) NSArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
}

#pragma mark
#pragma mark -  
-(NSArray *)dataArray
{
    if (_dataArray == nil) {
        NSString *filePath = [[NSBundle mainBundle]pathForResource:@"friends.plist" ofType:nil];
        NSMutableArray *mutb = [NSMutableArray array];
        NSArray *temp = [NSArray arrayWithContentsOfFile:filePath];
        for (NSDictionary *dict in temp) {
            GroupsModel *groupsModel = [GroupsModel groupsFriendsWithDict:dict];
            [mutb addObject:groupsModel];
            
        }
        _dataArray = mutb;
    }
    return _dataArray;
}

#pragma mark
#pragma mark -  组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}


#pragma mark
#pragma mark -  行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //行数:rowModel 决定
    GroupsModel *groupModel = self.dataArray[section];
    /*
     点击列表可以展示和隐藏好友,利用行数来实现.点击时,行数为0,
     */
    //旋转,不旋转
    return groupModel.isShow ? groupModel.friends.count :0;
}

#pragma mark
#pragma mark -  行内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"QQCell";
    
    QQCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault xreuseIdentifier:identifier];
        //实例化---加载nib
#warning .lastObject
        cell = [[NSBundle mainBundle]loadNibNamed:@"QQCell" owner:nil options:nil].lastObject;
        
    }
    GroupsModel *groupsModel =  self.dataArray[indexPath.section];
    
    rowModel *model = groupsModel.friends[indexPath.row];
    cell.model = model;
    NSLog(@"cell");
    return cell;
}

#pragma mark
#pragma mark - 设置section的header

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    static NSString *identifier = @"headerView";
    HeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (headerView == nil) {
        headerView = [[HeaderView alloc]initWithReuseIdentifier:identifier];
        headerView.delegate = self;
    }
    /*
     设置headerView的frame在这里设置不是太好,在HeaderView中可以专门设置frame
     */
//    #warning 这个是专门设置组头控件的,所以不用再设置view,可以直接设置所需要的控件.
//    UIButton *button = [[UIButton alloc]init];
//    [button setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
//    [button setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
//    //button的image
//    [button setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
//    //设置button上的空间靠左
//    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    button.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
//    button.titleEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
//    //button的title
//    GroupsModel *model = self.dataArray[section];
//    NSString *str = model.name;
//    [button setTitle:str forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    
//    //button的label
//    CGFloat labelWidth = 60;
//    CGFloat labelX = self.view.frame.size.width - labelWidth;
//    CGFloat labelY = 0;
//    #warning label的高度要和header的高度一样,否则无法label文本无法显示居中
//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(labelX, labelY, labelWidth, 35)];
//    label.text = [NSString stringWithFormat:@"%@/%lu",model.online,(unsigned long)model.friends.count];
//    label.textAlignment = NSTextAlignmentCenter;
//    
//    [button addSubview:label];
//
    GroupsModel *model = self.dataArray[section];
    
    headerView.model = model;
    headerView.tag = section;
    headerView.rotateImage = model.isShow;
    NSLog(@"1111111111");//打印:滚动时会一直反复调用,所以要重用标识符
    return  headerView;
}

#pragma mark
#pragma mark -  实现HeaderView的代理方法
-(void)HeaderView:(HeaderView *)headerModel andDidClickButton:(UIButton *)button
{
    NSInteger tag = headerModel.tag;
    //取出model
    GroupsModel *model = self.dataArray[tag];
    /*
     在这里设置图片旋转与否,内容显示与否
     */
    //旋转图片
    headerModel.rotateImage = YES;
    //内容显示
    //怎么知道点击的是哪个section:通过设置tag来实现(在cell内容)
    //刷新
    NSIndexSet *index = [NSIndexSet indexSetWithIndex:tag];
    model.isShow = !model.show;
    [self.tableView reloadSections:index withRowAnimation:UITableViewRowAnimationAutomatic];//当数据刷新的时候,会执行上面的代码,所以图片不会旋转(默认是不旋转的)
    NSLog(@"%ld",(long)tag);
}
#pragma mark
#pragma mark -  组头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}
-(BOOL)prefersStatusBarHidden
{
    return YES;
}
@end
