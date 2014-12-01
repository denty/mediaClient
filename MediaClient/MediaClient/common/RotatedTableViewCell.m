//
//  RotatedTableViewCell.m
//  MediaClient
//
//  Created by broy denty on 14-12-1.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "RotatedTableViewCell.h"

@implementation RotatedTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect frame = self.frame;
        self.transform = CGAffineTransformRotate( CGAffineTransformIdentity, M_PI/2);
        self.frame = frame;
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        CGRect frame = self.frame;
        self.transform = CGAffineTransformRotate( CGAffineTransformIdentity, M_PI/2);
        self.frame = frame;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super init];
    if (self) {
        CGRect frame = self.frame;
        self.transform = CGAffineTransformRotate( CGAffineTransformIdentity, M_PI/2);
        self.frame = frame;
    }
    return self;
}

- (void)awakeFromNib
{
    if (self) {
        CGRect frame = self.frame;
        self.transform = CGAffineTransformRotate( CGAffineTransformIdentity, M_PI/2);
        self.frame = frame;
    }
}
@end
