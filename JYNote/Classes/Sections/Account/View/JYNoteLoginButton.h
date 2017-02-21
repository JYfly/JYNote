//
//  JYNoteLoginButton.h
//  JYNote
//
//  Created by chen_sy on 2017/2/21.
//  Copyright © 2017年 chen_sy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^finishBlock)();

@interface JYNoteLoginButton : UIView

@property (nonatomic, copy) finishBlock translateBlock;

@end
