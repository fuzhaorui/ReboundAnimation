//
//  ViewController.m
//  Rebound
//
//  Created by IOS-开发机 on 15/11/30.
//  Copyright © 2015年 IOS-开发机. All rights reserved.
//

#import "ViewController.h"
#import "ReboundAction.h"
@interface ViewController ()
@property(strong ,nonatomic)IBOutlet UIView *reboundView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}
-(IBAction)reboundAction:(UIButton *)sender
{
    if (sender.tag == 1000) {

        [[ReboundAction shareInstance]performAnimationOnView:self.reboundView mobileDirectionType:FZRMobileDirectionTypeLeft mobileDistance:20 springbackFrequency:6 duration:0.5 delay:0];
    }
    else if (sender.tag == 1001)
    {
        [[ReboundAction shareInstance]performAnimationOnView:self.reboundView mobileDirectionType:FZRMobileDirectionTypeRight mobileDistance:20 springbackFrequency:6 duration:0.5 delay:0];
    }
    else if (sender.tag == 1002) {

        [[ReboundAction shareInstance]performAnimationOnView:self.reboundView mobileDirectionType:FZRMobileDirectionTypeUp mobileDistance:20 springbackFrequency:6 duration:0.5 delay:0];
    }
    else
    {
        [[ReboundAction shareInstance]performAnimationOnView:self.reboundView mobileDirectionType:FZRMobileDirectionTypeDown mobileDistance:20 springbackFrequency:6 duration:0.5 delay:0];
    }
    
    
}

@end
