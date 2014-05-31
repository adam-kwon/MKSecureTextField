//
//  ViewController.m
//  CustomPasswordTextField
//
//  Created by Min Kwon on 5/29/14.
//  Copyright (c) 2014 Min Kwon. All rights reserved.
//

#import "ViewController.h"
#import "MKSecureTextField.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    MKSecureTextField *secure = [[MKSecureTextField alloc] initWithFrame:CGRectMake(35, 100, 250, 40)];
    [self.view addSubview:secure];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
