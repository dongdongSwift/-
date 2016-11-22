//
//  EssenceVideoCell.m
//  百思不得姐
//
//  Created by 张冬 on 2016/11/22.
//  Copyright © 2016年 张冬. All rights reserved.
//

#import "EssenceVideoCell.h"
#import "BDJEssenceModel.h"
#import "UIImageView+WebCache.h"



@interface EssenceVideoCell()
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *passTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageHCons;


@property (weak, nonatomic) IBOutlet UIImageView *vidoImageView;
@property (weak, nonatomic) IBOutlet UILabel *playNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *playTimeLabel;


@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UILabel *tagLabel;
@property (weak, nonatomic) IBOutlet UIButton *dingButton;
@property (weak, nonatomic) IBOutlet UIButton *caiButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;

@end

@implementation EssenceVideoCell

+ (EssenceVideoCell *)videoCellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexpath withModel:(BDJEssenceDetail *)detailModel {
    static NSString *cellId = @"videoCellId";
    EssenceVideoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (nil == cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"EssenceVideoCell" owner:nil options:nil] lastObject];
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
    //5.图片
    NSString *videoString = [detailModel.video.thumbnail_small firstObject];
    NSURL *videoURL = [NSURL URLWithString:videoString];
    [self.vidoImageView sd_setImageWithURL:videoURL placeholderImage:[UIImage imageNamed:@"post_placeholderImage"]];
       //修改高度   图片宽度/图片高度 == width/height
    CGFloat imageH = (kScreenWidth-20)*detailModel.video.height.floatValue/detailModel.video.width.floatValue;
    self.imageHCons.constant = imageH;
    
    //6.播放次数
    self.playNumLabel.text =[detailModel.video.playcount stringValue];
    //7.视频时间
    NSInteger min = 0;
    NSInteger sec = [detailModel.video.duration integerValue];
    if (sec >= 60) {
        min = sec/60;
        sec = sec%60;
    }
    self.playTimeLabel.text = [NSString stringWithFormat:@"%02ld:%02ld",min,sec];
    //8.评论文字
    if (detailModel.top_comments.count>0) {
        BDJEssenceComment *comment = [detailModel.top_comments firstObject];
        self.commentLabel.text = comment.content;
    }
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
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
    
}
//播放按钮
- (IBAction)palyBtn:(UIButton *)sender {
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
