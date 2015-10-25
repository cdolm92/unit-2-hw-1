//
//  NYWikiViewController.m
//  TalkinToTheNet
//
//  Created by Christella on 10/24/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "NYWikiViewController.h"

@interface NYWikiViewController ()

@end

@implementation NYWikiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:@"https://en.wikipedia.org/wiki/New_York_City"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.wikiWebView loadRequest:request];
    
    
 
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
