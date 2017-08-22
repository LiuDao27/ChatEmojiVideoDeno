//
//  ChatEmojiClickView.h
//  ChatEmojiViewDemo
//
//  Created by lvshasha on 2017/8/21.
//  Copyright © 2017年 com.SmallCircle. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^emojiClickBlock)(NSString* emojiClickString);
@interface ChatEmojiClickView : UIView

- (instancetype)initWithFrame:(CGRect)frame imageArray:(NSMutableArray *)imageArray coloum:(NSInteger)coloum row:(NSInteger)row emojiClickTag:(NSInteger)emojiClickTag;
//
@property (nonatomic, copy) emojiClickBlock emojiClickBlock;
@end
