//
//  HMTitleButton.m
//  BlackWeibo
//
//  Created by Wenxuan Chen on 12/15/15.
//  Copyright © 2015 Wenxuan Chen. All rights reserved.
//

#import "HMTitleButton.h"
#import "UIView+Utilities.h"
#import "UIFont+Utilities.h"

@implementation HMTitleButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentRight;
        
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont HMNavigationTitleFont];
        
        // 高亮的时候不需要调整图片（UIButton）
        self.adjustsImageWhenHighlighted = NO;
    }
    return self;
}


/**
 * 设置内部图标的frame
 */
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat imageY = 0;
    CGFloat imageW = contentRect.size.height;
    CGFloat imageH = contentRect.size.height;
    CGFloat imageX = self.width - imageW;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

/**
 * 设置内部文字的frame
 */
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    CGFloat titleW = self.width - self.height;
    CGFloat titleH = self.height;
    return CGRectMake(titleX, titleY, titleW, titleH);
}

@end
