//
//  UIImageView+CornerRedious.h
//  TestCategoryAddPropertyDemo
//
//  Created by AA on 16/1/11.
//  Copyright © 2016年 Caoly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (CornerRedious)

@property (nonatomic,assign)NSInteger cornerRadious;
@property (nonatomic,weak)  UIColor  * layerColor;
@property (nonatomic,retain)NSString * imageName;
@property (nonatomic,assign)CGFloat   borderWidth;
- (void)addOthers;
@end
