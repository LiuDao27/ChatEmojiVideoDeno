//
//  ChatEmojiView.h
//  ChatEmojiViewDemo
//
//  Created by lvshasha on 2017/8/21.
//  Copyright © 2017年 com.SmallCircle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatEmojiView : UIView
- (instancetype)initWithChatViewFrame:(CGRect)chatViewFrame;
//
@property (nonatomic, strong) NSString *emojiShowString;
@end
