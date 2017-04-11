//
//  ViewController.m
//  SWCache
//
//  Created by  677676  on 17/4/11.
//  Copyright © 2017年 艾腾软件. All rights reserved.
//

#import "ViewController.h"
#import "SWCache.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
- (IBAction)tongbuBtn:(id)sender {
    NSDictionary * dic = @{
                           @"name":@"tongbu",
                           @"age":@18
                           };
    [[SWCache shareManager]sw_SetSynData:dic withKey:@"dicHehe"];
}



- (IBAction)tongbuRead:(id)sender {
    
    id dic = [[SWCache shareManager]sw_GetSynDataWithKey:@"dicHehe"];
    NSLog(@"==%@",dic);
}



- (IBAction)yibuBtn:(id)sender {
    
    NSArray * arr = @[@"一些人",@"一辈子",@"记得归档",@"对象要归档"];
    [[SWCache shareManager]sw_SetAsynData:arr withKey:@"arr"];
    
}


- (IBAction)yibuRead:(id)sender {
    
    [[SWCache shareManager]sw_GetAsynDataWithKey:@"arr" WithBlock:^(id data) {
        
        NSLog(@"==%@",(NSArray *)data);
        
    }];
}



- (IBAction)Clear:(id)sender {
    
    [[SWCache shareManager]sw_CleanDataWithKey:@"dicHehe"];
    
}




@end
