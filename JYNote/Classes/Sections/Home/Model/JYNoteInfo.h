//
//  JYNoteInfo.h
//  JYNote
//
//  Created by chen_sy on 2017/3/1.
//  Copyright © 2017年 chen_sy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JYNoteAlertInfo.h"

@interface JYNoteInfo : NSObject

//笔记创建时间
@property (nonatomic, strong) NSDate *creatDate;
//笔记标题
@property (nonatomic, strong) NSString *noteTitle;
//笔记描述
@property (nonatomic, strong) NSString *noteContent;
//笔记图片
@property (nonatomic, strong) NSMutableArray *noteImages;
//笔记声音
@property (nonatomic, strong) NSMutableArray *sound;
//笔记视频
@property (nonatomic, strong) NSMutableArray *viedio;
//笔记提醒
@property (nonatomic, strong) JYNoteAlertInfo *alertInfo;

@end
