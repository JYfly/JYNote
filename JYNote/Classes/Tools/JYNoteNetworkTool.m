//
//  JYNoteNetworkTool.m
//  JYNote
//
//  Created by chen_sy on 2017/2/21.
//  Copyright © 2017年 chen_sy. All rights reserved.
//

#import "JYNoteNetworkTool.h"

@implementation JYNoteNetworkTool

+ (instancetype)sharedManager {
    static JYNoteNetworkTool *_networkTool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _networkTool = [[self alloc] init];
    });

    return _networkTool;
}

@end
