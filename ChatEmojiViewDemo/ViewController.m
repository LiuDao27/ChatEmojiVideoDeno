//
//  ViewController.m
//  ChatEmojiViewDemo
//
//  Created by lvshasha on 2017/8/21.
//  Copyright © 2017年 com.SmallCircle. All rights reserved.
//

#import "ViewController.h"
#import "ChatEmojiView.h"

#define KSCREENWIDTH ([UIScreen mainScreen].applicationFrame.size.width)
#define KSCREENHEIGHT ([UIScreen mainScreen].applicationFrame.size.height)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ChatEmojiView *emojiView = [[ChatEmojiView alloc] initWithChatViewFrame:CGRectMake(0, 100, KSCREENWIDTH, 200)];
    [self.view addSubview:emojiView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
