//
//  UIBarButtonItem+Utilities.m
//  BlackWeibo
//
//  Created by Wenxuan Chen on 12/2/15.
//  Copyright © 2015 Wenxuan Chen. All rights reserved.
//

#import "UIBarButtonItem+Utilities.h"
#import "UIImage+Utilities.h"
#import "UIView+Utilities.h"

@implementation UIBarButtonItem(Utilities)
+(UIBarButtonItem *)itemWithImageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName target:(id)target action:(SEL)action {
    UIButton *button = [[UIButton alloc]init];
    [button setBackgroundImage:[UIImage imageWithName:imageName] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageWithName:highlightedImageName] forState:UIControlStateHighlighted];
    
    button.size = button.currentBackgroundImage.size;
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc]initWithCustomView:button];
}
@end
