//
//  ViewController.m
//  SpellGuide
//
//  Created by Sarmila on 6/1/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "ViewController.h"
#import "ResultViewController.h"
@interface ViewController ()

@end

@implementation ViewController
NSString *referenceWord;
NSMutableArray *referenceWordArray;
NSDictionary *helperWords;
NSMutableArray *inputArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initHelpWords];
    referenceWordArray = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)initHelpWords{
 helperWords= @{@"a": @"air",
    @"b": @"beat",
    @"c": @"cleat",
    @"d": @"deer",
    @"e": @"ear",
    @"f": @"fear",
    @"g": @"gear",
    @"h": @"hear",
    @"i": @"ire",
    @"j": @"joke",
    @"k": @"know",
    @"l": @"low",
    @"m": @"meat",
    @"n": @"now",
    @"o": @"oar",
    @"p": @"pour",
    @"q": @"que",
    @"r": @"rear",
    @"s": @"seal",
    @"t": @"tear",
    @"u": @"umbrella",
    @"v": @"vine",
    @"w": @"wine",
    @"x": @"xyst",
    @"y": @"year",
    @"z": @"zeal"};
}

-(void)stringConvertToArray{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    NSString *inputText= [_inputTextField.text lowercaseString];
    for (int i=0; i < inputText.length; i++) {
        NSString *tmp_str = [inputText substringWithRange:NSMakeRange(i, 1)];
        [arr addObject:tmp_str];
    }
    inputArray = arr;
    NSLog(inputArray.description);
}

- (IBAction)spellWordSubmit:(UIButton *)sender {
    [self stringConvertToArray];
    
    for(int x = 0; x < [inputArray count]; x++){
        [referenceWordArray addObject:[helperWords objectForKey: [NSString stringWithFormat:@"%@", inputArray[x]]]];
    }
    NSLog(@"%@", referenceWordArray.description);
    [self performSegueWithIdentifier:@"showResult" sender:self];
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"showResult"])
    {
        // Get reference to the destination view controller
        ResultViewController *vc = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...
        
       // vc.resultRestaurant = chosenRestaurant;
        vc.resultArray = referenceWordArray;
    }
}

@end
