//
//  UIBarButtonItem+Utilities.h
//  BlackWeibo
//
//  Created by Wenxuan Chen on 12/2/15.
//  Copyright © 2015 Wenxuan Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem(Utilities)
+(UIBarButtonItem *)itemWithImageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName target:(id)target action:(SEL)action;
@end
