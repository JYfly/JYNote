//
//  JYNoteLoginTextField.h
//  JYNote
//
//  Created by chen_sy on 2017/2/21.
//  Copyright © 2017年 chen_sy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JYNoteLoginTextField : UIView

//注释信息
@property (nonatomic,copy) NSString *ly_placeholder;

//光标颜色
@property (nonatomic,strong) UIColor *cursorColor;

//注释普通状态下颜色
@property (nonatomic,strong) UIColor *placeholderNormalStateColor;

//注释选中状态下颜色
@property (nonatomic,strong) UIColor *placeholderSelectStateColor;

@end
