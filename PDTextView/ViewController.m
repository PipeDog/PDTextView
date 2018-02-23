//
//  ViewController.m
//  PDTextView
//
//  Created by liang on 2018/2/23.
//  Copyright © 2018年 PipeDog. All rights reserved.
//

#import "ViewController.h"
#import "PDTextView.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet PDTextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    PDTextView *textView = [[PDTextView alloc] initWithFrame:CGRectMake(16, 340, CGRectGetWidth(self.view.bounds) - 32, 200)];
    textView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    textView.placeholder = @"Placeholder...";
    [self.view addSubview:textView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
