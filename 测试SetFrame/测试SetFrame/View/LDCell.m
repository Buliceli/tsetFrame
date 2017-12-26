//
//  LDCell.m
//  测试SetFrame
//
//  Created by 李洞洞 on 26/12/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import "LDCell.h"

@implementation LDCell
- (void)setFrame:(CGRect)frame
{
    frame.origin.y += 30;
    frame.size.height -= 30;
    frame.origin.x += 10;
    frame.size.width -= 20;
    [super setFrame:frame];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
