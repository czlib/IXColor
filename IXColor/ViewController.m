//
//  ViewController.m
//  IXColor
//
//  Created by Seven on 2018/4/3.
//  Copyright © 2018年 Seven. All rights reserved.
//

#import "ViewController.h"
#import "NextVC.h"

@interface ViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>
@property (nonatomic, strong) UITableView   * tableV;
@property (nonatomic, strong) NSArray       * itemArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Home";
    self.view.backgroundColorPicker = IXColorPickerWithRGB(kHexWhite,kHexBlack);
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColorPicker = IXColorPickerWithRGB(kHexWhite,kHexBlack);
    
    
    [self.view addSubview:self.tableV];
}


#pragma mark -
#pragma mark - table view

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.itemArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [(NSArray *)self.itemArr[section] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 30;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView  * v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 30)];
    v.backgroundColorPicker = IXColorPickerWithRGB(kHexWhite,kHexBlack);
    return v;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"xxxxx"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"xxxxx"];
    }
    
    cell.backgroundColorPicker = IXColorPickerWithRGB(0xffffff,0x000000);
    cell.textLabel.textColorPicker = IXColorPickerWithRGB(0x000000,0xffffff);
    cell.textLabel.text = self.itemArr[indexPath.section][indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NextVC  * vc = [NextVC new];
    vc.titleStr = self.itemArr[indexPath.section][indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}


- (UITableView *)tableV
{
    if (!_tableV) {
        _tableV = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableV.separatorColorPicker = IXColorPickerWithRGB(kHexGray_line,kWhite);
        _tableV.backgroundColorPicker = IXColorPickerWithRGB(kHexWhite,kHexBlack);
        _tableV.delegate = self;
        _tableV.dataSource = self;
        _tableV.tableFooterView = [UIView new];
    }
    
    return _tableV;
}

- (NSArray *)itemArr
{
    if (!_itemArr) {
        _itemArr = @[
                     @[@"UILabel",
                       @"UITextField",
                       @"UITextView"],
                     @[@"UIButton",
                       @"UISlider",
                       @"UIProgressView",
                       @"UIImageView"]
                     ];
    }
    return _itemArr;
}

@end
