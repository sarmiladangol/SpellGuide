//
//  ViewController.m
//  SpellGuide
//
//  Created by Sarmila on 6/1/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"
@interface ViewController ()

@end

@implementation ViewController
NSString *referenceWord;
NSMutableArray *referenceWordArray;
NSDictionary *helperWords;
NSMutableArray *inputArray;
NSArray *pickerData;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    pickerData = @[@"NATO Dictionary",@"Hard Dictionary"];
    
    //Connect Data
    self.dictionaryPicker.dataSource = self;
    self.dictionaryPicker.delegate = self;
    
    [self initHelpWords:0];
    referenceWordArray = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Number of columns of data
-(int)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return pickerData.count;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return pickerData[row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    [self initHelpWords:row];
}


-(void)initHelpWords:(int)pickerSelection{
    NSDictionary *natoHelperWords = @{@"a": @"Alfa",
                                      @"b": @"Bravo",
                                      @"c": @"Charlie",
                                      @"d": @"Delta",
                                      @"e": @"Echo",
                                      @"f": @"Foxtrot",
                                      @"g": @"Golf",
                                      @"h": @"Hotel",
                                      @"i": @"India",
                                      @"j": @"Juliet",
                                      @"k": @"Kilo",
                                      @"l": @"Lima",
                                      @"m": @"Mike",
                                      @"n": @"November",
                                      @"o": @"Oscar",
                                      @"p": @"Papa",
                                      @"q": @"Quebec",
                                      @"r": @"Romeo",
                                      @"s": @"Sierra",
                                      @"t": @"Tango",
                                      @"u": @"Uniform",
                                      @"v": @"Victor",
                                      @"w": @"Whiskey",
                                      @"x": @"Xray",
                                      @"y": @"Yankee",
                                      @"z": @"Zulu"};
    
    NSDictionary *uglyHelperWords =@{@"a": @"air",
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
    if(pickerSelection == 0)
        helperWords= natoHelperWords;
    else
        helperWords = uglyHelperWords;
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
    if(_inputTextField.text.length==0){
        NSString *message=@"Please enter valid string!";
        NSString *alertTitle=@"Warning!";
        NSString *OKText=@"OK";
        
        UIAlertController *alertView = [UIAlertController alertControllerWithTitle:alertTitle message:message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:OKText style:UIAlertActionStyleCancel handler:nil];
        [alertView addAction:alertAction];
        [self presentViewController:alertView animated:YES completion:nil];    }
    
    else{
        [self stringConvertToArray];
        for(int x = 0; x < [inputArray count]; x++){
            if([helperWords objectForKey:[NSString stringWithFormat:@"%@", inputArray[x]]] != nil){
            [referenceWordArray addObject:[helperWords objectForKey: [NSString stringWithFormat:@"%@", inputArray[x]]]];
            }
            else{
                [referenceWordArray addObject:[NSString stringWithFormat:@"%@", inputArray[x]]];
            }
        }
        NSLog(@"%@", referenceWordArray.description);
        
        [self performSegueWithIdentifier:@"showResult" sender:self];
    }
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"showResult"])
    {
        // Get reference to the destination view controller
        TableViewController *vc = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...
        
       // vc.resultRestaurant = chosenRestaurant;
        vc.resultArray = referenceWordArray;
    }
}

@end
