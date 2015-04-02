//
//  DiscussionViewController.m
//  KTAppFrame
//
//  Created by jayden on 15/3/30.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

#import "KTDiscussionViewController.h"
#import "KTDiscussionView.h"
#import "KTDiscussionTableViewCell.h"

#define SEARCH_TEXTLIMIT        100
#define TOPIC_PAGE_SIZE         30

@interface KTDiscussionViewController ()<KTDiscussionViewDelegate,UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,weak) UITableView *tableView;
@property(nonatomic,strong)NSMutableDictionary *heightStoreDic;
@end

@implementation KTDiscussionViewController

-(void)loadView{    
    KTDiscussionView * view = [[KTDiscussionView alloc] initWithFrame:[self getFrame]];
    view.delegate = self;
    view.tableView.delegate = self;
    view.tableView.dataSource = self;
    view.tableSearchBar.delegate = self;
    self.view = view;
    self.tableView = view.tableView;
    
}

#pragma mark - KTDiscussionViewDelegate
-(void)addDiscussion:(id)sender{

}

#pragma makr - tableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self autoAdjustedCellHeightAtIndexPath:indexPath inTableView:tableView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"cell";
    KTDiscussionTableViewCell *cell  = [self cellForTableView:tableView rowAtIndexPath:indexPath andReuseIdentifier:CellIdentifier];
   
    [cell updateConstraints];
    
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];

//    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}



- (CGFloat)autoAdjustedCellHeightAtIndexPath:(NSIndexPath *)indexPath inTableView:(UITableView *)tableView {
    
    CGFloat cellHeight = [self cellHeightAtIndexPath:indexPath];
    if (cellHeight > 0) {
        return cellHeight;
    } else {
        KTDiscussionTableViewCell *cell = [self cellForTableView:tableView rowAtIndexPath:indexPath andReuseIdentifier:nil];
        
         [cell updateConstraints];
        
        [cell setNeedsUpdateConstraints];
        [cell updateConstraintsIfNeeded];
        [cell setNeedsLayout];
        [cell layoutIfNeeded];
       
        
        CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
        
        height += 1.0f;
        //计算完后保存，避免多次重复计算
        [self saveCellHeight:height forIndexPath:indexPath];
        return height;
    }
}

-(CGFloat)cellHeightAtIndexPath:(NSIndexPath *)indexPath{
    if (!self.heightStoreDic) {
        self.heightStoreDic = [NSMutableDictionary dictionaryWithCapacity:20];
    }
    
    if ([[self.heightStoreDic allKeys] indexOfObject:indexPath] >= 0 ) {
        return [[self.heightStoreDic objectForKey:indexPath] floatValue];
    }
    return 0;
}

-(KTDiscussionTableViewCell*) cellForTableView:(UITableView *)tableView rowAtIndexPath:(NSIndexPath *)indexPath andReuseIdentifier:(NSString *)CellIdentifier {
    KTDiscussionTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[KTDiscussionTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.toppedLabel.text = @"置顶";
    cell.nicknameLabel.text  = @"jayden12343545454466466";
    cell.timeLabel.text  = @"03-23 14:57";
    cell.replycountLabel.text  = @"回复(17)|称赞(128)";
    cell.contentLabel.text = @"可视对讲发动机啊金卡剪发剪发会计法啊了放假啊开发可浪费电脑蹙额车U盾vhcsvnauhvuana那句拿狙击啊vbj那今年初vajbcjabvcanjncjacnjanajn那就拿vajnvjavnavj";
    [cell.headBtn setBackgroundImage:nil forState:UIControlStateNormal];
    cell.headBtn.backgroundColor = [UIColor greenColor];
    
    return cell;
}

-(void)saveCellHeight:(CGFloat)height forIndexPath:(NSIndexPath *)indexPath{
    if (!self.heightStoreDic) {
        self.heightStoreDic = [NSMutableDictionary dictionaryWithCapacity:20];
    }
    
    [self.heightStoreDic setObject:@(height) forKey:indexPath];
}


#pragma mark - 搜索

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
//    if (searchBar.text!=nil&&searchBar.text.length!=0) {
//        
//        [self.gameSearchDiscussions removeAllObjects];
//        [self searchDiscussion:searchBar.text];
//        self.refreshHeaderView.hidden = NO;
//    }
}


-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:YES];
//    NSArray *searBarSubViews = [searchBar subviews];
//    for(UIView  *subview in searBarSubViews)
//    {
//        if ([searBarSubViews count]==1) {
//            for(UIView  *subSubview in [subview subviews])
//            {
//                if ([subSubview isKindOfClass:[UIButton class]]) {
//                    [((UIButton *)subSubview) setTitle:[KTResManager loadString:STRING_CANCEL] forState:UIControlStateNormal];
//                    break;
//                }
//            }
//            break;
//        }else{
//            if ([subview isKindOfClass:[UIButton class]]) {
//                [((UIButton *)subview) setTitle:[KTResManager loadString:STRING_CANCEL] forState:UIControlStateNormal];
//                break;
//            }
//        }
//    }
}


- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar{
//    self.isSearch = NO;
//    searchBar.text = @"";
//    self.hasMore = (self.gameDiscussions.count < self.discussionTotal);
//    
//    
//    [searchBar setShowsCancelButton:NO animated:NO];
//    [searchBar resignFirstResponder];
}

- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if (text.length == 0 || [text isEqualToString:@"\n"]) {
        return YES;
    }else if (searchBar.text.length + text.length > SEARCH_TEXTLIMIT) {
        return NO;
    }else{
        return YES;
    }
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
//    // 字符如果变为空，则数据显示为disscussion,而不是search的
//    if (searchText.length > 0){
//        
//        self.refreshHeaderView.hidden = YES;
//    }
//    else {
//        self.isSearch = NO;
////        _topLabel.text = [NSString stringWithFormat:[KTResManager loadString:STRING_TOPIC_COUNT],[@(0) stringValue]];
//    }
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
