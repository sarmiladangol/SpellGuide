//
//  ResultViewController.h
//  SpellGuide
//
//  Created by Sarmila on 6/1/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface ResultViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property NSMutableArray *resultArray;
@end
