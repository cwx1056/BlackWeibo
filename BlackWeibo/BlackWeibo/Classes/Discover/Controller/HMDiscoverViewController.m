//
//  HMDiscoverViewController.m
//  BlackWeibo
//
//  Created by Wenxuan Chen on 12/2/15.
//  Copyright © 2015 Wenxuan Chen. All rights reserved.
//

/** 
 1. textAligement: 文本对齐，即内部文字的水平对齐（只要有文字的都有这个属性）
    1> 取值
        NSTextAlignmentLeft = 1.0
        NSTextAlignmentCenter = 2.0
        NSTextAlignmentRight = 1.0
    2> 哪些控件有这个属性：一般能够显示文字的控件都有这个属性
        * UITextField
        * UILabel
        * UITextView
 
 2. contetnVerticalAlignment: 内容的垂直（UIController）
    1> 取值
        UIControlContentVerticalAlignmentCenter = 0, // 垂直居中对齐
        UIControlContentVerticalAlignmentTop = 1, // 顶部对齐
        UIControlContentVerticalAlignmentBottom = 2, // 底部对齐
        UIControlContetnVerticalAlignmentFill = 3 //
    2> 哪些控件有这个属性： 继承自UIControl, 或者UIControl本身
        * UIControl
        * UIButton
        * UITextField
        * ...
 
 3. contetnHorizontalAlignment: 内容的水平方向的对齐方式
    1> 取值
         UIControlContentHorizontalAlignmentCenter = 0,
         UIControlContentHorizontalAlignmentLeft   = 1,
         UIControlContentHorizontalAlignmentRight  = 2,
         UIControlContentHorizontalAlignmentFill   = 3,
 
 4. contentMode: 内容模式（控制内容的对齐方式）
    1> 取值
         UIViewContentModeScaleToFill,         // （Default）拉升图片至填充整个UIImageView
         UIViewContentModeScaleAspectFit,      // contents scaled to fit with fixed aspect. remainder is transparent
         UIViewContentModeScaleAspectFill,     // contents scaled to fill with fixed aspect. some portion of content may be clipped.
         UIViewContentModeRedraw,              // redraw on bounds change (calls -setNeedsDisplay) 当控件的尺寸改变，就会重新绘制一次（重新调用setNeedsDisplay）
         UIViewContentModeCenter,              // contents remain same size. positioned adjusted.
         UIViewContentModeTop,
         UIViewContentModeBottom,
         UIViewContentModeLeft,
         UIViewContentModeRight,
         UIViewContentModeTopLeft,
         UIViewContentModeTopRight,
         UIViewContentModeBottomLeft,
         UIViewContentModeBottomRight,
    2> 哪些控件有这个属性： 所有UIView控件都有这个属性
 
 5. 如果有多个属性的作用冲突了，那采用就近原则，采用最有效的。
 */

#import "HMDiscoverViewController.h"
#import "UIImage+Utilities.h"
#import "UIView+Utilities.h"
#import "HMSearchBar.h"

@interface HMDiscoverViewController ()

@end

@implementation HMDiscoverViewController

- (void)viewDidLoad  {
    [super viewDidLoad];
    
    HMSearchBar *searchBar = [HMSearchBar searchBar];
    searchBar.width = 300;
    searchBar.height = 30; 

    self.navigationItem.titleView = searchBar;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"测试数据------%ld", indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *newVC = [[UIViewController alloc]init];
    newVC.title = @"新控制器";
    
    [self.navigationController pushViewController:newVC animated:YES];
}

@end
