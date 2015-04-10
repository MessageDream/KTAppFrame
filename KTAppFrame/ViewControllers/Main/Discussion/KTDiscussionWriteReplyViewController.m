//
//  KTDiscussionWriteReplyViewController.m
//  KTAppFrame
//
//  Created by Jayden Zhao on 15/4/10.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

#import "KTDiscussionWriteReplyViewController.h"
#import "KTDiscussionWriteReplyView.h"

@interface KTDiscussionWriteReplyViewController ()

@end

@implementation KTDiscussionWriteReplyViewController

-(void)loadView{
    KTDiscussionWriteReplyView * view = [[KTDiscussionWriteReplyView alloc] init];
    self.view = view;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
