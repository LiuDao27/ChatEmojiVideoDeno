//
//  ChatEmojiClickView.m
//  ChatEmojiViewDemo
//
//  Created by lvshasha on 2017/8/21.
//  Copyright © 2017年 com.SmallCircle. All rights reserved.
//

#import "ChatEmojiClickView.h"

@implementation ChatEmojiClickView
- (instancetype)initWithFrame:(CGRect)frame imageArray:(NSMutableArray *)imageArray coloum:(NSInteger)coloum row:(NSInteger)row  emojiClickTag:(NSInteger)emojiClickTag
{
    if (self = [super initWithFrame:frame]) {
        //
        UIView *baseClickView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        baseClickView.backgroundColor = [UIColor clearColor];
        baseClickView.tag = emojiClickTag;
        [self addSubview:baseClickView];
        
        //
        for (NSInteger i = 0; i < imageArray.count + 1; i++) {
            NSInteger rowIndex = i / 8; // row
            NSInteger coloumIndex = i % 8; // coloum
            UIButton *clickButton = [UIButton buttonWithType:UIButtonTypeCustom];
            clickButton.frame = CGRectMake(frame.size.width/8 * coloumIndex, frame.size.height/3 * rowIndex, frame.size.width/8, frame.size.height/3);
            clickButton.backgroundColor = [UIColor clearColor];
            [baseClickView addSubview:clickButton];
            if (imageArray.count == i) {
                [clickButton setImage:[UIImage imageNamed:@"emojiDelegate"] forState:UIControlStateNormal];
                clickButton.imageEdgeInsets = UIEdgeInsetsMake(15, 10, 15, 10);
                [clickButton addTarget:self action:@selector(buttonDelegate) forControlEvents:UIControlEventTouchUpInside];
            } else {
                [clickButton setTitle:imageArray[i] forState:UIControlStateNormal];
                [clickButton addTarget:self action:@selector(buttonClickEmoji:) forControlEvents:UIControlEventTouchUpInside];
            }
        }
    }
    return self;
}

- (void)buttonDelegate
{
    self.emojiClickBlock(@"");
}

- (void)buttonClickEmoji:(UIButton *)button
{
    self.emojiClickBlock(button.titleLabel.text);
}

@end
