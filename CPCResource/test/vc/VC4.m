//
//  VC4.m
//  CPCResource
//
//  Created by 鹏程 on 17/2/27.
//  Copyright © 2017年 池鹏程. All rights reserved.
//

#import "VC4.h"

@interface VC4 ()<UIWebViewDelegate>
@property(nonatomic,strong)UIWebView* webV;
@property(nonatomic,strong)UITableView* tableV;

@property(nonatomic,strong)UIScrollView* scrollV;
@property(nonatomic,assign)CGSize size;
@end

@implementation VC4

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
    
    _webV=[[UIWebView alloc] initWithFrame:self.view.bounds];
    
    
    //FIXME: http:// 这个不要忘记
    [_webV loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:c_readURL]]];
    _webV.delegate=self;
    _webV.scalesPageToFit = YES;//自动对页面进行缩放以适应屏幕
    _webV.scrollView.scrollEnabled=NO;//不能滚动
    
    
    [self.view addSubview:_webV];
    
    
    
    UILabel* lab=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, c_ViewW, 300)];
    lab.numberOfLines=0;
    lab.text=@"webView动态高度 (tableView)也可以模仿它  避免了 多个scrollView嵌套";
    
    lab.textColor=[UIColor redColor];
    lab.backgroundColor=[UIColor yellowColor];
    [self.view addSubview:lab];
}



- (void)webViewDidFinishLoad:(UIWebView *)webView
{

     CGFloat webViewHeight= [[webView stringByEvaluatingJavaScriptFromString:@"document.body.scrollHeight"]floatValue];
    CGRect newFrame = webView.frame;
    newFrame.size.height= webViewHeight;
    webView.frame= newFrame;
    
}

@end
