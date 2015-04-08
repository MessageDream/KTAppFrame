//
//  KTDIscussionDetailViewController.m
//  KTAppFrame
//
//  Created by Jayden Zhao on 15/4/7.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

#import "KTDIscussionDetailViewController.h"
#import "KTDIscussionDetailView.h"

@interface KTDIscussionDetailViewController ()<UITableViewDataSource,UITableViewDelegate,KTCustomTitleBar_ButtonDelegate>
@property(nonatomic,weak)KTDIscussionDetailView *mainView;
@end

@implementation KTDIscussionDetailViewController


-(void)loadView{
    self.navigationItem.title = @"话题详情";
    
    KTDIscussionDetailView *view = [[KTDIscussionDetailView alloc] initWithTableViewStyle:UITableViewStylePlain];
//    view.backgroundColor = [UIColor yellowColor];
    self.view = self.mainView = view;
    view.customTitleBar.buttonEventObserver = self;
    
}

-(void)snsShare:(id)sender{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainView.contentView.nicknameLabel.text  = @"jayden12343545454466466";
     self.mainView.contentView.timeLabel.text  = @"03-23 14:57";
     self.mainView.contentView.contentLabel.text = @"可视对讲发动机啊金卡剪发剪发会计法啊了放假啊开发可浪费电脑蹙额车U盾vhcsvnauhvuana那句拿狙击啊vbj那今年初vajbcjabvcanjncjacnjanajn那就拿vajnvjavnavj";
    [ self.mainView.contentView.headBtn setBackgroundImage:[UIImage imageNamed:@"defaulthead"] forState:UIControlStateNormal];
    self.mainView.contentView.isWriteBySelf = NO;
    self.mainView.contentView.likeCount = 10;
    self.mainView.contentView.picUrls = @[@"tab_blank_selected_5"];
    // Do any additional setup after loading the view.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)leftButton_onClick:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
//    navigationController.navigationBarHidden = NO;
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
