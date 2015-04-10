//
//  KTDIscussionDetailViewController.m
//  KTAppFrame
//
//  Created by Jayden Zhao on 15/4/7.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

#import "KTDiscussionDetailViewController.h"
#import "KTDiscussionDetailView.h"
#import "KTDiscussionReplyTableViewCell.h"
#import "KTDiscussionWriteReplyViewController.h"

@interface KTDiscussionDetailViewController ()<UITableViewDataSource,UITableViewDelegate,KTCustomTitleBar_ButtonDelegate,KTDiscussionDetailViewDelegate>
@property(nonatomic,weak)KTDiscussionDetailView *mainView;
@property(nonatomic,weak) UITableView *tableView;
@property(nonatomic,strong)NSMutableDictionary *heightStoreDic;
@end

@implementation KTDiscussionDetailViewController


-(void)loadView{
    self.navigationItem.title = @"话题详情";
    
    KTDiscussionDetailView *view = [[KTDiscussionDetailView alloc] initWithTableViewStyle:UITableViewStylePlain];
    //    view.backgroundColor = [UIColor yellowColor];
    self.view = self.mainView = view;
    view.customTitleBar.buttonEventObserver = self;
    view.tableView.delegate = self;
    view.tableView.dataSource = self;
    view.delegate = self;
    
}

-(void)addReplyButton_click:(id)sender{
    KTDiscussionWriteReplyViewController * controller = [[KTDiscussionWriteReplyViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

-(void)snsShare:(id)sender{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainView.contentView.nicknameLabel.text  = @"jayden12343545454466466";
    self.mainView.contentView.timeLabel.text  = @"03-23 14:57";
    self.mainView.contentView.contentLabel.text = @"可视对讲发动机啊金卡剪发剪发会计法啊了放假啊开发可浪费电脑蹙额车U盾vhcsvnauhvuana那句拿狙击啊vbj那今年初vajbcjabvcanjncjacnjanajn那就拿vajnvjavnavj";
    [self.mainView.contentView.headBtn setBackgroundImage:[UIImage imageNamed:@"defaulthead"] forState:UIControlStateNormal];
    self.mainView.contentView.isWriteBySelf = NO;
    self.mainView.contentView.likeCount = 10;
    
    self.mainView.contentView.picUrls = @[@"tab_blank_selected_5"];
    // Do any additional setup after loading the view.
}

#pragma makr - tableView Delegate


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //    NSLog(@"cell height1=%i",indexPath.row);
    CGFloat height = [self autoAdjustedCellHeightAtIndexPath:indexPath inTableView:tableView];
    //    NSLog(@"cell height2=%i",indexPath.row);
    
    return height;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"cell";
    KTDiscussionReplyTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[KTDiscussionReplyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [self loadCellContent:cell indexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}



- (CGFloat)autoAdjustedCellHeightAtIndexPath:(NSIndexPath *)indexPath inTableView:(UITableView *)tableView {
    
    CGFloat cellHeight = [self cellHeightAtIndexPath:indexPath];
    if (cellHeight > 0) {
        return cellHeight;
    } else {
        static KTDiscussionReplyTableViewCell * cell = nil;
        if (!cell) {
            cell = [[KTDiscussionReplyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        [self loadCellContent:cell indexPath:indexPath];
        
        CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
        
//        height += 1.0f;
        [self saveCellHeight:height forIndexPath:indexPath];
        return height;
    }
}



- (void)loadCellContent:(KTDiscussionReplyTableViewCell*)cell indexPath:(NSIndexPath*)indexPath
{
    cell.detailView.nicknameLabel.text  = @"jayden12343545454466466";
    cell.detailView.timeLabel.text  = @"03-23 14:57";
    cell.detailView.contentLabel.text = @"可视对讲发动机啊金卡剪发剪发会计法啊了放假啊开发可浪费电脑蹙额车U盾vhcsvnauhvuana那句拿狙击啊vbj那今年初vajbcjabvcanjncjacnjanajn那就拿vajnvjavnavj";
    [cell.detailView.headBtn setBackgroundImage:[UIImage imageNamed:@"defaulthead"] forState:UIControlStateNormal];
    cell.detailView.isWriteBySelf = NO;
    cell.detailView.likeCount = 10;
    cell.detailView.picUrls = @[@"tab_blank_selected_5"];
}

-(CGFloat)cellHeightAtIndexPath:(NSIndexPath *)indexPath{
    if (!self.heightStoreDic) {
        self.heightStoreDic = [NSMutableDictionary dictionaryWithCapacity:20];
    }
    
    if ([self.heightStoreDic objectForKey:indexPath]) {
        return [[self.heightStoreDic objectForKey:indexPath] floatValue];
    }
    return 0;
}



-(void)saveCellHeight:(CGFloat)height forIndexPath:(NSIndexPath *)indexPath{
    if (!self.heightStoreDic) {
        self.heightStoreDic = [NSMutableDictionary dictionaryWithCapacity:20];
    }
    
    [self.heightStoreDic setObject:@(height) forKey:indexPath];
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
