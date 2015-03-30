//
//  ViewController.m
//  KTAppFrameTest
//
//  Created by Jayden Zhao on 15/3/30.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

#import "ViewController.h"
#import "KTAppFrame.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak UIView *view = self.view;
    view.backgroundColor = [UIColor greenColor];
    UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    startBtn.frame = CGRectMake(10, 100, 50, 50);
    [startBtn setTitle:@"启动" forState:UIControlStateNormal];
    [startBtn setBackgroundColor:[UIColor redColor]];
    [startBtn addTarget:self action:@selector(startKt:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:startBtn];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)startKt:(id)sender{
    KTAppFrame *frame = [[KTAppFrame alloc] init];
    [frame show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
