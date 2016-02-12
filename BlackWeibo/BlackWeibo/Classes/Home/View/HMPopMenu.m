//
//  HMPopMenu.m
//  BlackWeibo
//
//  Created by Wenxuan Chen on 12/16/15.
//  Copyright © 2015 Wenxuan Chen. All rights reserved.
//

#import "HMPopMenu.h"
#import "UIView+Utilities.h"
#import "UIImage+Utilities.h"

@interface HMPopMenu ()
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, weak) UIButton *cover;
@property (nonatomic, weak) UIImageView *container;
@end

@implementation HMPopMenu

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self){
        // 添加一个遮盖按钮
        UIButton *cover = [[UIButton alloc] init];
        cover.backgroundColor = [UIColor clearColor];
        [cover addTarget:self action:@selector(coverClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cover];
        self.cover = cover;
        
        // Init Container
        UIImageView *container = [[UIImageView alloc]init];
        container.userInteractionEnabled = YES;
        container.image = [UIImage resizedImage:@"popover_background"];
        [self addSubview:container];
        self.container = container;
    }
    
    return self;
}

- (instancetype)initWIthContentView:(UIView *)contentView {
    if (self = [super init]) {
        self.contentView = contentView;
    }
    return self;
}

+ (instancetype)popMenuWithContentView:(UIView *)contentView {
    return [[self alloc] initWIthContentView:contentView];
}

//???: layoutSubviews的用法，和调用时间
- (void)layoutSubviews {
    [super layoutSubviews];
    self.cover.frame = self.bounds;
}

# pragma mark - 私有方法
- (void)coverClick {
    [self dismiss];
}

# pragma mark - 公共方法
- (void)showInRect:(CGRect)rect {
    // Get the main Window
    UIWindow *mainWindow = [UIApplication sharedApplication].keyWindow;
    self.frame = mainWindow.bounds;
    [mainWindow addSubview:self];
    
    // Set container Frame
    self.container.frame = rect;
    [self.container addSubview:self.contentView];
    
    // 设置容器里面内容的frame
    CGFloat topMargin = 12;
    CGFloat leftMargin = 5;
    CGFloat rightMargin = 5;
    CGFloat bottomMargin = 8;
    
    self.contentView.y = topMargin;
    self.contentView.x = leftMargin;
    self.contentView.width = self.container.width - leftMargin - rightMargin;
    self.contentView.height = self.container.height - topMargin - bottomMargin;
}

- (void)setBackground:(UIImage *)background {
    self.container.image = background;
}

- (void)setDimBackground:(BOOL)dimBackground {
    _dimBackground = dimBackground;
    
    if (dimBackground) {
        self.cover.backgroundColor = [UIColor blackColor];
        self.cover.alpha = 0.3;
    } else {
        self.cover.backgroundColor = [UIColor clearColor];
        self.cover.alpha = 1.0;
    }
}

- (void)setArrowPosition:(HMPopMenuArrowPosition)arrowPosition {
    _arrowPosition = arrowPosition;
    
    switch (arrowPosition) {
        case HMPopMenuArrowPositionCenter:
            self.container.image = [UIImage resizedImage:@"popover_background"];
            break;
            
        case HMPopMenuArrowPositionLeft:
            self.container.image = [UIImage resizedImage:@"popover_background_left"];
            break;
            
        case HMPopMenuArrowPositionRight:
            self.container.image = [UIImage resizedImage:@"popover_background_right"];
            break;
    }
}

- (void)dismiss {
    //!!!检测delegate是否被实现的方法
    if ([self.delegate respondsToSelector:@selector(popMenuDidDismissed:)]) {
        [self.delegate popMenuDidDismissed:self];
    }
    
    [self removeFromSuperview];
}

@end
