//
//  HMSearchBar.m
//  BlackWeibo
//
//  Created by Wenxuan Chen on 12/15/15.
//  Copyright © 2015 Wenxuan Chen. All rights reserved.
//

#import "HMSearchBar.h"
#import "UIImage+Utilities.h"
#import "UIView+Utilities.h"

@implementation HMSearchBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self){
        self.background = [UIImage resizedImage:@"searchbar_textfield_background"];
        self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        
        // Set left View
        UIImageView *searchButtonView = [[UIImageView alloc] init];
        UIImage *leftImage = [UIImage imageWithName:@"searchbar_textfield_search_icon"];
        
        searchButtonView.image = leftImage;
        searchButtonView.size = leftImage.size;
        searchButtonView.width = leftImage.size.width + 10;
        searchButtonView.height = leftImage.size.height;
        searchButtonView.contentMode = UIViewContentModeCenter;
        
        self.leftView = searchButtonView;
        self.leftViewMode = UITextFieldViewModeAlways;
        self.clearButtonMode = UITextFieldViewModeAlways;
    }
    return self;
}

+ (instancetype)searchBar
{
    return [[self alloc]init];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
