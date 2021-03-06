//
//  SMSubscribeCell.m
//  RSSRead
//
//  Created by ming on 14-3-19.
//  Copyright (c) 2014年 starming. All rights reserved.
//

#import "SMSubscribeCell.h"
#import "SMUIKitHelper.h"

@implementation SMSubscribeCell {
    UILabel *_lbtitle;
    UIView *_sepView;
    UIButton *_btCount;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.contentView.backgroundColor = [SMUIKitHelper colorWithHexString:COLOR_BACKGROUND];
        _lbtitle = [SMUIKitHelper labelShadowWithRect:CGRectZero text:nil textColor:@"#444444" fontSize:18];
        [self.contentView addSubview:_lbtitle];
        
        _btCount = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btCount setBackgroundImage:[UIImage imageNamed:@"news.png"] forState:UIControlStateNormal];
        _btCount.titleLabel.font = [UIFont systemFontOfSize:12];
        [_btCount setUserInteractionEnabled:NO];
        [self.contentView addSubview:_btCount];
    }
    return self;
}

-(void)setSubscribe:(Subscribes *)subscribe {
    _btCount.hidden = YES;
    NSInteger count = [subscribe.total integerValue];
    if (count > 0) {
        [_btCount setTitle:[NSString stringWithFormat:@"%ld",(long)count] forState:UIControlStateNormal];
        _btCount.hidden = NO;
    }
    
    [_lbtitle setText:subscribe.title];
    [self setNeedsDisplay];
}

-(void)layoutSubviews {
    [super layoutSubviews];
    CGRect rect = CGRectZero;
    rect.origin.x = 14;
    rect.origin.y = 14;
    CGSize fitSize = [_lbtitle.text sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:18]}];
    rect.size = fitSize;
    rect.size.width = SCREEN_WIDTH - 30;
    _lbtitle.frame = rect;
    
    //记总数
    [_btCount setFrame:CGRectMake(SCREEN_WIDTH - 50, 16, 28, 18)];
    
    //分割线
//    rect =self.contentView.frame;
//    CGRect mrect = CGRectMake(0, rect.size.height - 1, rect.size.width, 1);
//    if (_sepView == nil) {
//        _sepView = [[UIView alloc] initWithFrame:mrect];
//        _sepView.backgroundColor = [SMUIKitHelper colorWithHexString:@"#e5e3de"];
//        [self.contentView addSubview:_sepView];
//    }
//    _sepView.frame = mrect;
}

+(float)heightForSubscribe {
    return 70;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
