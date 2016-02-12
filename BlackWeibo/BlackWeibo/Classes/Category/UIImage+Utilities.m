//
//  UIImage+Utilities.m
//  BlackWeibo
//
//  Created by Wenxuan Chen on 12/2/15.
//  Copyright © 2015 Wenxuan Chen. All rights reserved.
//

#import "UIImage+Utilities.h"

@implementation UIImage(Utilities)
+(UIImage *)imageWithName:(NSString *)imageName {
    UIImage *image = nil;
    if ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0) {
        NSString *newName = [imageName stringByAppendingString:@"_07"];
        image = [UIImage imageNamed:newName];
    }
    
    if (!image) {
        image = [UIImage imageNamed:imageName];
    }
    return image;
}

+(UIImage *)resizedImage:(NSString *)imageName {
    UIImage *image = [UIImage imageWithName:imageName];
    CGFloat verizon = image.size.height / 2;
    CGFloat horizon = image.size.width / 2;
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(verizon, horizon, verizon, horizon) resizingMode:UIImageResizingModeStretch];
}
@end
