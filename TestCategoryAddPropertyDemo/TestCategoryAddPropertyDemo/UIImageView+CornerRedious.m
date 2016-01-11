//
//  UIImageView+CornerRedious.m
//  TestCategoryAddPropertyDemo
//
//  Created by AA on 16/1/11.
//  Copyright © 2016年 Caoly. All rights reserved.
//

#import "UIImageView+CornerRedious.h"
#import <objc/runtime.h>

@implementation UIImageView (CornerRedious)
@dynamic cornerRadious;
@dynamic layerColor;
@dynamic imageName;
@dynamic borderWidth;
- (void)setCornerRadious:(NSInteger)cornerRadious {
    objc_setAssociatedObject(self, @"cornerRadious", @(cornerRadious), OBJC_ASSOCIATION_ASSIGN);
}

- (NSInteger)cornerRadious {

   id value = objc_getAssociatedObject(self, @"cornerRadious");
    return [value integerValue];
}

- (void)setLayerColor:(UIColor *)layerColor
{
    objc_setAssociatedObject(self, @"layerColor",layerColor, OBJC_ASSOCIATION_ASSIGN);
}

- (UIColor *)layerColor
{
  return  objc_getAssociatedObject(self, @"layerColor");
}

- (void)setImageName:(NSString *)imageName
{
    objc_setAssociatedObject(self, @"imageName", imageName, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)imageName
{
    return objc_getAssociatedObject(self, @"imageName");
}

- (void)setBorderWidth:(CGFloat)borderWidth
{
    objc_setAssociatedObject(self, @"borderWidth", @(borderWidth), OBJC_ASSOCIATION_ASSIGN);
}

- (CGFloat)borderWidth {
    return [objc_getAssociatedObject(self, @"borderWidth") floatValue];
}


- (void)addOthers {
    self.layer.cornerRadius = self.cornerRadious;
    self.layer.borderColor = (self.layerColor).CGColor;
    self.layer.borderWidth = self.borderWidth;
    self.layer.masksToBounds = YES;
    self.image = [UIImage imageNamed:self.imageName];
    
}

@end
