//
//  ViewController.m
//  MKKeyboardExtension
//
//  Created by 比由技术工场 on 2018/9/10.
//  Copyright © 2018年 com.biu.mark. All rights reserved.
//

#import "ViewController.h"
#import "MKKeyboardView.h"
#import "MKKeyboardDefaultTopView.h"
#import "Masonry.h"
#import "MKKeyboardShow.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) NSArray<NSString *> *entryClasses;

@property (strong, nonatomic) MKKeyboardDefaultTopView *defaultTopView;

@end

@implementation ViewController

- (NSArray<NSString *> *)entryClasses {
    if (!_entryClasses) {
        _entryClasses = @[@"defaultKeyboardyShowView",
                          @"imageKeyboardyShowView",
                          @"AtKeyboardyShowView",
                          @"AtImageKeyboardyShowView"];
    }
    return _entryClasses;
}

- (MKKeyboardDefaultTopView *)defaultTopView {
    if (!_defaultTopView) {
        _defaultTopView = [MKKeyboardDefaultTopView new];
        _defaultTopView.placeholderString = @"111";
        _defaultTopView.buttonTitleColor = [UIColor whiteColor];
        _defaultTopView.buttonTitle = @"haah";
        _defaultTopView.buttonBackGroundColor = [UIColor orangeColor];
        _defaultTopView.buttonTitleFont = 14.f;
    }
    return _defaultTopView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _tableView.sectionHeaderHeight = 10;
    _tableView.sectionFooterHeight = 0;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.entryClasses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *mainCellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:mainCellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:mainCellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        cell.textLabel.numberOfLines = 0;
        
        cell.detailTextLabel.lineBreakMode = NSLineBreakByCharWrapping;
        cell.detailTextLabel.textColor = [UIColor grayColor];
        cell.detailTextLabel.numberOfLines = 0;
    }
    
    cell.textLabel.text = self.entryClasses[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *className = self.entryClasses[indexPath.row];
    
    if ([className isEqualToString:@"defaultKeyboardyShowView"]) {
        //设置显示的弹出样式
        [MKKeyboardShow setDefaultMKKeyboardShowStyle:MKKeyboardShowStyleDefault];
        //设置显示什么样式的视图
        [MKKeyboardShow setDefaultMKKeyboardShowViewStyle:MKKeyboardShowViewStyleDefault];
        //视图上一些可以设置的部分
        [MKKeyboardShow setDefaultShowViewPlaceholder:@"说些什么吧" buttonTitle:@"发布" buttonTitleFont:14.f buttonBackGroundColor:[UIColor orangeColor] buttonTitleColor:[UIColor whiteColor]];
        //完成时候的回调
        [MKKeyboardShow showMkKeyBoardyViewSureCallBack:^(id  _Nullable backObject) {
            NSLog(@"backObject : %@",(NSString *)backObject);
        }];
        [MKKeyboardShow show];
    }
    
    if ([className isEqualToString:@"imageKeyboardyShowView"]) {
        [MKKeyboardShow setDefaultMKKeyboardShowStyle:MKKeyboardShowStyleDefault];
        [MKKeyboardShow setDefaultMKKeyboardShowViewStyle:MKKeyboardShowViewStyleImage];
        [MKKeyboardShow setDefaultShowViewPlaceholder:@"说些什么吧" buttonTitle:@"发布" buttonTitleFont:14.f buttonBackGroundColor:[UIColor orangeColor] buttonTitleColor:[UIColor whiteColor]];
        [MKKeyboardShow showMkKeyBoardyImageViewSureCallBack:^(id  _Nullable backObject) {
            NSLog(@"backObject : %@",(NSString *)backObject);
        } imageSelected:^{
            
        }];
        
        [MKKeyboardShow show];
    }
    
    if ([className isEqualToString:@"AtKeyboardyShowView"]) {
        [MKKeyboardShow setDefaultMKKeyboardShowStyle:MKKeyboardShowStyleDefault];
        [MKKeyboardShow setDefaultMKKeyboardShowViewStyle:MKKeyboardShowViewStyleAt];
        [MKKeyboardShow setDefaultShowViewPlaceholder:@"说些什么吧" buttonTitle:@"发布" buttonTitleFont:14.f buttonBackGroundColor:[UIColor orangeColor] buttonTitleColor:[UIColor whiteColor]];
        [MKKeyboardShow showMkKeyBoardAtViewSureallBack:^(id  _Nullable backObject) {
            NSLog(@"backObject : %@",(NSString *)backObject);
        } atSelected:^{
            
        }];
        
        [MKKeyboardShow show];
    }
    
    if ([className isEqualToString:@"AtImageKeyboardyShowView"]) {
        [MKKeyboardShow setDefaultMKKeyboardShowStyle:MKKeyboardShowStyleDefault];
        [MKKeyboardShow setDefaultMKKeyboardShowViewStyle:MKKeyboardShowViewStyleAtImage];
        [MKKeyboardShow setDefaultShowViewPlaceholder:@"说些什么吧" buttonTitle:@"发布" buttonTitleFont:14.f buttonBackGroundColor:[UIColor orangeColor] buttonTitleColor:[UIColor whiteColor]];
        [MKKeyboardShow showMkKeyBoardAtImageViewSureallBack:^(id  _Nullable backObject) {
            NSLog(@"backObject : %@",(NSString *)backObject);
        } atSelected:^{
            
        } imageSelected:^{
            
        }];
        
        [MKKeyboardShow show];
    }
    
}


@end
