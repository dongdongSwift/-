//
//  EssenceViewController.m
//  百思不得姐
//
//  Created by 张冬 on 2016/11/21.
//  Copyright © 2016年 张冬. All rights reserved.
//

#import "BDJTableViewController.h"
#import "BDJEssenceModel.h"
#import "EssenceVideoCell.h"
#import "EssenceImageCell.h"
#import "EssenceTextCell.h"
#import "EssenceAuaioCell.h"

@interface BDJTableViewController ()<UITableViewDelegate,UITableViewDataSource>
//表格
@property (nonatomic,strong)UITableView *tbView;
//数据
@property (nonatomic,strong)BDJEssenceModel *model;

//分页
@property (nonatomic,strong)NSNumber *np;

@end

@implementation BDJTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    //http://s.budejie.com/topic/list/jingxuan/41/bs0315-iphone-4.3/0-20.json
    //创建表格
    [self createTableView];
    //下载数据
    self.np = @(0);
    [self downloadListData];
}
//创建表格的方法
- (void)createTableView {
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tbView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tbView.delegate = self;
    self.tbView.dataSource = self;
    [self.view addSubview:_tbView];
    
    //约束
    __weak typeof(self) weakSelf = self;
    [self.tbView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view);
    }];
    
    //下拉刷新
    self.tbView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadFirstPage)];
    //上拉加载更多
    
    self.tbView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadNextPage)];
}
//下拉方法
- (void)loadFirstPage {
    self.np = @(0);
    [self downloadListData];
}

//上拉方法
- (void)loadNextPage {
    self.np = self.model.info.np;
    [self downloadListData];
}

//下载  数据
- (void)downloadListData {
    
    //开始下载
    [ProgressHUD show:@"正在下载" Interaction:NO];
    NSString *urlString = [NSString stringWithFormat:@"%@/bs0315-iphone-4.3/%@-20.json",self.url,self.np];
    
    
    [BDJDownloader downloadWithURLString:urlString success:^(NSData *data) {
        NSError *error = nil;
        BDJEssenceModel *model = [[BDJEssenceModel alloc] initWithData:data error:&error];
        if (error) {
            NSLog(@"%@",error);
        }else{
            //第一页
            if (self.np.integerValue == 0) {
                //第一页
                self.model = model;
            }else{
                //后面的页数
                NSMutableArray *tmpArray = [NSMutableArray arrayWithArray:self.model.list];
                [tmpArray addObjectsFromArray:model.list];
                model.list = (NSArray<BDJEssenceDetail> *)tmpArray;
                self.model = model;
            }
            
            //刷新表格
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tbView reloadData];
                
                //就是 上下拉刷新
                [self.tbView.mj_header endRefreshing];
                [self.tbView.mj_footer endRefreshing];
                
                [ProgressHUD showSuccess:@"下载成功"];
            });
        }
        
        // NSLog(@"=====");
    } fail:^(NSError *error) {
        // NSLog(@"%@",error);
        [ProgressHUD showError:@"下载失败"];
    }];
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
#pragma mark -UITableView的代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.model.list.count;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 500;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BDJEssenceDetail *detail = self.model.list[indexPath.row];
    UITableViewCell *cell = nil;
    if ([detail.type isEqualToString:@"video"]){
        //视频的cell
        cell = [EssenceVideoCell videoCellForTableView:tableView atIndexPath:indexPath withModel:detail];
    }else if ([detail.type isEqualToString:@"image"]) {
        cell = [EssenceImageCell imageCellForTableView:tableView atIndexPath:indexPath withModel:detail];
       
    }else if ([detail.type isEqualToString:@"text"]) {
        cell = [EssenceTextCell textCellForTableView:tableView atIndexPath:indexPath withModel:detail];
        
    }else if ([detail.type isEqualToString:@"audio"]) {
        cell = [EssenceAuaioCell audioCellForTableView:tableView atIndexPath:indexPath withModel:detail];
    }else{
        cell = [[UITableViewCell alloc]init];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
   
   
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    BDJEssenceDetail *detai = self.model.list[indexPath.row];
    return detai.cellHeight.floatValue;
}


@end
