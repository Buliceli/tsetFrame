//
//  ViewController.m
//  测试SetFrame
//
//  Created by 李洞洞 on 26/12/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import "ViewController.h"
#import "LDCell.h"
// RGB颜色
#define HWColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

// 随机色
#define HWRandomColor HWColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * dataArr;
@end
static NSString * cellID = @"cellID";
@implementation ViewController
- (NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [NSMutableArray arrayWithArray:@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",]];
        
    }
    return _dataArr;
    
}
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerNib:[UINib nibWithNibName:@"LDCell" bundle:nil] forCellReuseIdentifier:@"cellID"];
        //[_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LDCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.backgroundColor = HWRandomColor;
    cell.ldLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    return cell;
}

#pragma mark --- 左滑相关
- (NSArray*)tableView:(UITableView*)tableView editActionsForRowAtIndexPath:(NSIndexPath*)indexPath
{
    UITableViewRowAction* rowAction =
    [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除"handler:^(UITableViewRowAction*_Nonnullaction,NSIndexPath*_NonnullindexPath) {
        
        NSLog(@"删除要实现的代码");
        
        [self.dataArr removeObjectAtIndex:indexPath.row];
         [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }];
    //自定义颜色
    rowAction.backgroundColor=HWColor(21, 157, 250);
    NSArray*arr =@[rowAction];
    
    return arr;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100+5;
}
@end
