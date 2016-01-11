//
//  TestOCView.m
//  TestCategoryAddPropertyDemo
//
//  Created by AA on 16/1/11.
//  Copyright © 2016年 Caoly. All rights reserved.
//

#import "TestOCView.h"
#import "UIImageView+CornerRedious.h"

@implementation TestOCView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addImageView];
    }
    return self;
}

- (void)addImageView {
    
    UIImageView * testView = [[UIImageView alloc]init];
    testView.imageName = @"monkey.jpg";
    testView.layerColor = [UIColor blueColor];
    testView.cornerRadious = 3;
    [testView addOthers];
    
    [self addSubview:testView];
}

@end
