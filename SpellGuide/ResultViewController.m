//
//  ResultViewController.m
//  SpellGuide
//
//  Created by Sarmila on 6/1/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "ResultViewController.h"
#import "ViewController.h"


@interface ResultViewController ()

@end

@implementation ResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"R%@", _resultArray.description);
    NSString *finalString = @"";
    for(id object in _resultArray){
        [finalString stringByAppendingString:object];
    }
    NSLog(@"%@", finalString);
    _resultLabel.text = finalString;
   
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
