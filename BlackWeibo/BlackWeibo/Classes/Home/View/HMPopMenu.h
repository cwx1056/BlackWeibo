//
//  HMPopMenu.h
//  BlackWeibo
//
//  Created by Wenxuan Chen on 12/16/15.
//  Copyright © 2015 Wenxuan Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    HMPopMenuArrowPositionCenter = 0,
    HMPopMenuArrowPositionLeft = 1,
    HMPopMenuArrowPositionRight = 2
} HMPopMenuArrowPosition;

@class HMPopMenu;

@protocol HMPopMenuDelegate <NSObject>

@optional
-(void)popMenuDidDismissed:(HMPopMenu *)popMenu;
@end

@interface HMPopMenu : UIView

@property (nonatomic, weak) id<HMPopMenuDelegate> delegate;
@property (nonatomic, assign, getter=isDimBackground) BOOL dimBackground;
@property (nonatomic, assign) HMPopMenuArrowPosition arrowPosition;

/**
 * 初始化方法
 */
- (instancetype)initWIthContentView:(UIView *) contentView;
+ (instancetype)popMenuWithContentView:(UIView *) contentView;


/**
 * 设置菜单的背景图片
 */
- (void)setBackground:(UIImage *)background;

/**
 *  显示菜单
 */
- (void)showInRect:(CGRect)rect;

/**
 *  关闭菜单
 */
- (void)dismiss;

@end
