//
//  EssenceImageCell.m
//  百思不得姐
//
//  Created by 张冬 on 2016/11/22.
//  Copyright © 2016年 张冬. All rights reserved.
//

#import "EssenceTextCell.h"
#import "BDJEssenceModel.h"
#import "UIImageView+WebCache.h"



@interface EssenceTextCell()
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *passTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *commentViewHCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *commentLabelYCons;






@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UILabel *tagLabel;
@property (weak, nonatomic) IBOutlet UIButton *dingButton;
@property (weak, nonatomic) IBOutlet UIButton *caiButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;

@end

@implementation EssenceTextCell

+ (EssenceTextCell *)textCellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexpath withModel:(BDJEssenceDetail *)detailModel {
    static NSString *cellId = @"textCellId";
    EssenceTextCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (nil == cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"EssenceTextCell" owner:nil options:nil] lastObject];
    }
    //数据
    cell.detailModel = detailModel;
    return cell;
}

-(void)setDetailModel:(BDJEssenceDetail *)detailModel {
    _detailModel = detailModel;
    //1.用户图标
    NSURL *url = [NSURL URLWithString:[detailModel.u.header firstObject]];
    [self.userImageView sd_setImageWithURL:url ];
    
    //2.用户名
    self.userNameLabel.text = detailModel.u.name;
    //3.时间
    self.passTimeLabel.text = detailModel.text;
    //4.描述文字
    self.descLabel.text = detailModel.text;
  
    //8.评论文字
    if (detailModel.top_comments.count>0) {
        //有评论
        BDJEssenceComment *comment = [detailModel.top_comments firstObject];
        self.commentLabel.text = comment.content;
    }else{
        //没有评论
        self.commentViewHCons = 0;
        self.commentLabelYCons = 0;
    }
    
    //强制 刷新 一次
    [self layoutIfNeeded];
    

 //   if (detailModel.top_comments.count>0) {
      
        
  //      self.commentViewHCons.constant = 10;
  //      self.commentLabelYCons.constant = self.commentLabel.frame.size.height+10+10;
 //   }else {
        //没有评论的部分
    //    self.commentViewHCons = 0;
   //     self.commentLabelYCons = 0;
        
 //   }
    //9.标签
    NSMutableString *tagString = [NSMutableString string];
    for (NSInteger i=0;i<detailModel.tags.count;i++){
        BDJEssenceTags *tag = detailModel.tags[i];
        [tagString appendFormat:@"%@",tag.name];
    }
    self.tagLabel.text = tagString;
    //10.顶，踩，分享，评论的数量
    [self.dingButton setTitle:detailModel.up forState:UIControlStateNormal];
    [self.caiButton setTitle:[detailModel.down stringValue] forState:UIControlStateNormal];
    [self.shareButton setTitle:[detailModel.forward stringValue] forState:UIControlStateNormal];
    [self.commentButton setTitle:detailModel.comment forState:UIControlStateNormal];
    
    //强制 刷新 一次
    [self layoutIfNeeded];
    
    //获取cell的高度
   detailModel.cellHeight = @(CGRectGetMaxY(self.dingButton.frame)+10+10);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
    
}

//更多按钮
- (IBAction)clickMoreBtn:(UIButton *)sender {
}
//顶
- (IBAction)dingAction:(id)sender {
}
- (IBAction)caiAction:(id)sender {
}
- (IBAction)shareAction:(id)sender {
}
- (IBAction)commentAction:(id)sender {
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
@end
