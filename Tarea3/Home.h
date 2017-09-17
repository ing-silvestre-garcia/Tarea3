//
//  ViewController.h
//  Tarea3
//
//  Created by Silvestre Garcia on 9/16/17.
//  Copyright © 2017 silver. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Home : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lbColor;
@property (weak, nonatomic) IBOutlet UILabel *lbRed;
@property (weak, nonatomic) IBOutlet UILabel *lbGreen;
@property (weak, nonatomic) IBOutlet UILabel *lbBlue;
@property (weak, nonatomic) IBOutlet UILabel *circle;

@property (weak, nonatomic) IBOutlet UITextField *txtColor;

@property (weak, nonatomic) IBOutlet UISlider *slRed;
@property (weak, nonatomic) IBOutlet UISlider *slGreen;
@property (weak, nonatomic) IBOutlet UISlider *slBlue;

- (IBAction)changeGreen:(id)sender;
- (IBAction)changeBlue:(id)sender;
- (IBAction)changeRed:(id)sender;

@end

