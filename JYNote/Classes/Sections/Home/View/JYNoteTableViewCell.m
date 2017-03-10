//
//  JYNoteTableViewCell.m
//  JYNote
//
//  Created by chen_sy on 2017/3/1.
//  Copyright © 2017年 chen_sy. All rights reserved.
//

#import "JYNoteTableViewCell.h"
#import "JYNoteConst.h"

@interface JYNoteTableViewCell ()

@property (nonatomic, strong) UILabel *tilteLabel;

@property (nonatomic, strong) UIView * view;

@end

@implementation JYNoteTableViewCell



//重写
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        self.view = [[UIView alloc] initWithFrame:CGRectMake(10, 10, kScreenWidth - 20, 90)];
        self.view.backgroundColor = [UIColor whiteColor];
        self.view.layer.borderWidth = 1;
        self.view.layer.borderColor = [[UIColor grayColor] CGColor];
        self.view.layer.cornerRadius = 10;
        self.view.layer.masksToBounds = YES;
        [self.contentView addSubview:self.view];
        
        self.tilteLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 200, 30)];
        [self.view addSubview:self.tilteLabel];
    }
    return self;
}

- (void)setNoteInfo:(JYNoteInfo *)noteInfo {
    _noteInfo = noteInfo;
    self.tilteLabel.text = _noteInfo.noteTitle;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
