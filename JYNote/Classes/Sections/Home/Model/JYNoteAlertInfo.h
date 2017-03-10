//
//  JYNoteAlertInfo.h
//  JYNote
//
//  Created by chen_sy on 2017/3/2.
//  Copyright © 2017年 chen_sy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JYNoteAlertInfo : NSObject

//是否存在提醒
@property (nonatomic, assign) BOOL isAlert;
//提醒标题
@property (nonatomic, strong) NSString *alertTitle;
//提醒副标题
@property (nonatomic, strong) NSString *alertSubTitle;
//提醒内容
@property (nonatomic, strong) NSString *alertContent;
//提醒时间
@property (nonatomic, strong) NSDate *alertDate;

@end
