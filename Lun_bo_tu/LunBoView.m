//
//  LunBoView.m
//  Lun_bo_tu
//
//  Created by 袁玉灵 on 2018/7/4.
//  Copyright © 2018年 袁玉灵. All rights reserved.
//

#import "LunBoView.h"
#define Width self.bounds.size.width
#define Height self.bounds.size.height
@interface LunBoView ()<UIScrollViewDelegate>
/**<#注释#> */
@property (nonatomic,strong) UIScrollView *scrollView;
/**<#注释#> */
@property (nonatomic,strong) UIPageControl *pageControl;
/**<#注释#> */
@property (nonatomic,strong) NSTimer *timer;
@end
@implementation LunBoView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.scrollView = [[UIScrollView alloc]init];
        [self addSubview:self.scrollView];
        self.pageControl = [[UIPageControl alloc]init];
        [self addSubview:self.pageControl];
        self.scrollView.delegate = self;
    }
    return self;
}

//控件布局
-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.scrollView.frame = CGRectMake(0, 0, Width, Height);
    self.pageControl.frame = CGRectMake(50, 160, 200, 30);
    self.pageControl.numberOfPages = self.imageArray.count;
    [self.pageControl addTarget:self action:@selector(pageControlAction:) forControlEvents:UIControlEventValueChanged];
    
    self.scrollView.pagingEnabled = YES;
    self.scrollView.scrollEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(Width * (self.imageArray.count +1), Height);
    
    //创建imageView
    for (int i = 0; i<self.imageArray.count+1;i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.frame = CGRectMake(i * Width, 0, Width, Height);
        imageView.backgroundColor = [UIColor cyanColor];
        [self.scrollView addSubview:imageView];
        if (i == self.imageArray.count) {
            imageView.image = self.imageArray[0];
        }else{
            imageView.image = self.imageArray[i];
        }
    }
    [self addTimer];
}
//开启定时器
-(void)addTimer{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
}
//关闭定时器
-(void)stopTimer{
    [self.timer invalidate];
    self.timer = nil;
}
//定时器触发的方法
-(void)timerAction:(NSTimer *)timer{
    NSInteger page = [self getCurrentPage];
    
    NSLog(@"page = %ld",(long)page);
    [self.scrollView setContentOffset:CGPointMake((page +1)* Width, 0) animated:YES];
    
    
}
//pageControl触发的方法
-(void)pageControlAction:(UIPageControl *)pageControl{
    
    NSInteger page = [self getCurrentPage];
    [self.scrollView setContentOffset:CGPointMake(page * Width, 0) animated:YES];
}

-(NSInteger )getCurrentPage{
    return   self.scrollView.contentOffset.x / Width;
}
//*********************scrollView的代理方法
//2 6789
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"%s",__func__);
}

//1
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"%s",__func__);
    [self stopTimer];
        if (self.scrollView.contentOffset.x == 0) {
            self.scrollView.contentOffset = CGPointMake(self.imageArray.count * Width, 0 );
            [self.scrollView setContentOffset:CGPointMake((self.imageArray.count -1) * Width, 0) animated:YES];
            [self addTimer];
        }
}
//3
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset NS_AVAILABLE_IOS(5_0){
    NSLog(@"%s",__func__);
}
//4
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"%s",__func__);
}
//5
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    NSLog(@"%s",__func__);
}
//10
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    NSLog(@"%s",__func__);
    if (self.scrollView.contentOffset.x == self.imageArray.count * Width) {
        self.scrollView.contentOffset = CGPointMake(0, 0 );
    }
    self.pageControl.currentPage = [self getCurrentPage];
    
    [self addTimer];
}
//setContentOffset,scrollView不是人为拖动,触发的方法
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    NSLog(@"%s",__func__);
    if (self.scrollView.contentOffset.x == self.imageArray.count * Width) {
        self.scrollView.contentOffset = CGPointMake(0, 0 );
    }
    self.pageControl.currentPage = [self getCurrentPage];
}

@end
