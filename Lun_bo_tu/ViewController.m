//
//  ViewController.m
//  Lun_bo_tu
//
//  Created by 袁玉灵 on 2018/7/4.
//  Copyright © 2018年 袁玉灵. All rights reserved.
//

#import "ViewController.h"
#import "LunBoView.h"
#define Height [UIScreen mainScreen].bounds.size.height
#define Width [UIScreen mainScreen].bounds.size.width
@interface ViewController ()
/**<#注释#> */
@property (nonatomic,strong) LunBoView *lunboView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.lunboView = [[LunBoView alloc]initWithFrame:CGRectMake(10, (Height-200)/2, Width - 20, 200)];
    self.lunboView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.lunboView.imageArray = @[[UIImage imageNamed:@"1.jpg"],
                                  [UIImage imageNamed:@"2.jpg"],
                                  [UIImage imageNamed:@"3.jpg"],
                                  [UIImage imageNamed:@"4.jpg"],
                                  [UIImage imageNamed:@"5.jpg"],
                                  [UIImage imageNamed:@"6.jpg"],
                                  [UIImage imageNamed:@"7.jpg"],
                                  [UIImage imageNamed:@"8.jpg"]
                                  ];
    [self.view addSubview:self.lunboView];

    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
