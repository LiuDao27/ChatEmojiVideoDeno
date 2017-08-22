//
//  ChatEmojiView.m
//  ChatEmojiViewDemo
//
//  Created by lvshasha on 2017/8/21.
//  Copyright © 2017年 com.SmallCircle. All rights reserved.
//

#import "ChatEmojiView.h"
#import "ChatEmojiClickView.h"

#define KSCREENWIDTH ([UIScreen mainScreen].applicationFrame.size.width)
#define KSCREENHEIGHT ([UIScreen mainScreen].applicationFrame.size.height)

@interface ChatEmojiView ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *chatBaseScrollView;
@property (nonatomic, strong) UIPageControl *chatPageControl;
@property (nonatomic, strong) ChatEmojiClickView *emojiClickView;
@end

@implementation ChatEmojiView
- (instancetype)initWithChatViewFrame:(CGRect)chatViewFrame
{
    if (self = [super initWithFrame:chatViewFrame]) {
        // 需要读取表情数据
        NSString *emojiPath = [[NSBundle mainBundle] pathForResource:@"ISEmojiList" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:emojiPath];

        NSInteger pageCount = array.count / 24;
        NSInteger anotherPageCount = (array.count % 24) != 0 ? 1 : 0;
        
        self.chatBaseScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0,KSCREENWIDTH, chatViewFrame.size.height - 30)];
        self.chatBaseScrollView.backgroundColor = [UIColor whiteColor];
        self.chatBaseScrollView.pagingEnabled = YES;
        self.chatBaseScrollView.bounces = NO;
        self.chatBaseScrollView.showsHorizontalScrollIndicator = NO;
        self.chatBaseScrollView.delegate = self;
        self.chatBaseScrollView.contentSize = CGSizeMake(KSCREENWIDTH *(pageCount + anotherPageCount), chatViewFrame.size.height - 30);
        [self addSubview:self.chatBaseScrollView];
        
        //
        self.chatPageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, chatViewFrame.size.height - 30, KSCREENWIDTH, 30)];
        self.chatPageControl.backgroundColor = [UIColor redColor];
        self.chatPageControl.numberOfPages = pageCount + anotherPageCount;
        self.chatPageControl.currentPage = 0;
        self.chatPageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
        self.chatPageControl.currentPageIndicatorTintColor = [UIColor grayColor];
        self.chatPageControl.hidesForSinglePage = YES;
        self.chatPageControl.userInteractionEnabled = YES;
        [self.chatPageControl addTarget:self action:@selector(chatChangePage:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:self.chatPageControl];
        
        
        //
        for (NSInteger i = 0; i < (pageCount + anotherPageCount); i++) {
            //
            NSMutableArray *emojiDataArray = [NSMutableArray array];
            for (NSInteger j = 23 * i; j < 23 * (i + 1) && j < array.count; j++) {
                [emojiDataArray addObject:array[j]];
            }
            ChatEmojiClickView *emojiClickView = [[ChatEmojiClickView alloc] initWithFrame:CGRectMake(KSCREENWIDTH * i, 0, KSCREENWIDTH, chatViewFrame.size.height - 30)
                                                                                imageArray:emojiDataArray
                                                                                    coloum:8
                                                                                       row:3
                                                                             emojiClickTag:56788+i];
            __weak typeof(self) weakSelf = self;
            emojiClickView.emojiClickBlock= ^(NSString* emojiClickString) {
                weakSelf.emojiShowString = emojiClickString;
                NSLog(@"weakSelf.emojiShowString %@", weakSelf.emojiShowString);
            };
            [self.chatBaseScrollView addSubview:emojiClickView];
            self.emojiClickView = emojiClickView;
        }
        
    }
    return self;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.chatPageControl.currentPage = (int)(scrollView.contentOffset.x / scrollView.frame.size.width + 0.5);
}

- (void)chatChangePage:(UIPageControl *)page
{
    self.chatBaseScrollView.contentOffset = CGPointMake(page.currentPage * KSCREENWIDTH, 0);
}

@end
