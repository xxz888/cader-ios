//
//  KDShareHeaderView.m
//  KaDeShiJie
//
//  Created by SS001 on 2020/9/8.
//  Copyright © 2020 SS001. All rights reserved.
//

#import "KDShareHeaderView.h"


@interface KDShareHeaderView ()
@property (weak, nonatomic) IBOutlet UIStackView *centerView;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UILabel *personLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;

@end

@implementation KDShareHeaderView

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    for (QMUIButton *btn in self.centerView.subviews) {
        btn.imagePosition = QMUIButtonImagePositionTop;
    }
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"KDShareHeaderView" owner:nil options:nil];
        self = [views lastObject];
    }
    return self;
}


- (IBAction)topAction:(UIButton *)sender {
    NSString *title = sender.currentTitle;
    if ([title isEqualToString:@"分享素材"]) {
        [MCPagingStore pagingURL:rt_share_article];
    } else if ([title isEqualToString:@"推广二维码"]) {
        [MCPagingStore pagingURL:rt_share_single];
    } else if ([title isEqualToString:@"收益规则"]) {
        [MCPagingStore pushWebWithTitle:title classification:@"功能跳转"];
    }
}

- (void)setContent:(NSDictionary *)content
{
    _content = content;
    
    self.yearLabel.attributedText = [self getAttsWithString:content[@"anniversary"] firstString:@"年"];
    NSInteger person = [content[@"registerNumber"] intValue];
    NSString *personStr = nil;
    if (person < 10000) {
        personStr = [NSString stringWithFormat:@"%ld", (long)person];
    } else if (person < 100000000) {
        personStr = [NSString stringWithFormat:@"%.2f万", person / 10000.0];
    } else {
        personStr = [NSString stringWithFormat:@"%.2f亿", person / 100000000.0];
    }
    personStr = [personStr containsString:@".00"] ? [personStr replaceAll:@".00" target:@""] : personStr;
    self.personLabel.attributedText = [self getAttsWithString:personStr firstString:@"人"];
    NSInteger money = [content[@"tradingVolume"] intValue];
    NSString *moneyStr = nil;
    if (money < 10000) {
        moneyStr = [NSString stringWithFormat:@"%ld", (long)money];
    } else if (money < 100000000) {
        moneyStr = [NSString stringWithFormat:@"%.2f万", money / 10000.0];
    } else {
        moneyStr = [NSString stringWithFormat:@"%.2f亿", money / 100000000.0];
    }
    moneyStr = [moneyStr containsString:@".00"] ? [moneyStr replaceAll:@".00" target:@""] : moneyStr;
    self.moneyLabel.attributedText = [self getAttsWithString:moneyStr firstString:@"元"];
}

- (NSMutableAttributedString *)getAttsWithString:(NSString *)first firstString:(NSString *)last
{
    NSString *fullString = [NSString stringWithFormat:@"%@%@", first,last];
    NSMutableAttributedString *atts = [[NSMutableAttributedString alloc] initWithString:fullString];
    [atts addAttribute:NSForegroundColorAttributeName value:[UIColor mainColor] range:NSMakeRange(0, first.length)];
    return atts;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, 340);
}
@end
