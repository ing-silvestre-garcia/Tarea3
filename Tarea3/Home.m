//
//  ViewController.m
//  Tarea3
//
//  Created by Silvestre Garcia on 9/16/17.
//  Copyright © 2017 silver. All rights reserved.
//

#import "Home.h"

int rcolor=0;
int gcolor=0;
int bcolor=0;

UIColor *color;
NSString *hex;

@interface Home ()

@end

@implementation Home

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self refreshColor];
}

void setColor(int rcol,int gcol,int bcol){
    rcolor=rcol;
    gcolor=gcol;
    bcolor=bcol;
    color=[UIColor colorWithRed:rcolor/255.0
                          green:gcolor/255.0
                           blue:bcolor/255.0
                          alpha:1];
    
}

-(void) refreshColor{
    //Asi se llama a un action
    //[self changeGreen:nil];
    
    gcolor=self.slGreen.value;
    self.lbGreen.text=[@(gcolor) stringValue];
    
    bcolor=self.slBlue.value;
    self.lbBlue.text=[@(bcolor) stringValue];
    
    rcolor=self.slRed.value;
    self.lbRed.text=[@(rcolor) stringValue];
    setColor(rcolor, gcolor, bcolor);
    
    
    self.lbColor.backgroundColor=color;
    
    NSString *hexred=@"";
    hexred = [NSString stringWithFormat:@"%lX",
              (unsigned long)[[@(rcolor) stringValue] integerValue]];
    
    NSString *hexgreen=@"";
    hexgreen = [NSString stringWithFormat:@"%lX",
                (unsigned long)[[@(gcolor) stringValue] integerValue]];
    
    NSString *hexblue=@"";
    hexblue = [NSString stringWithFormat:@"%lX",
               (unsigned long)[[@(bcolor) stringValue] integerValue]];
    
}

- (IBAction)changeRed:(id)sender {
    [self refreshColor];
}


- (IBAction)changeGreen:(id)sender {
    [self refreshColor];
}

- (IBAction)changeBlue:(id)sender {
    [self refreshColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchVisibleValue:(id)sender {
    UISwitch *mySwitch = (UISwitch *)sender;
    if ([mySwitch isOn]) {
        NSLog(@"its on!");
        self.lbColor.hidden=true;
        self.circle.hidden=true;
        self.lbRed.hidden=true;
        self.lbGreen.hidden=true;
        self.lbBlue.hidden=true;
        self.slRed.hidden=true;
        self.slGreen.hidden=true;
        self.slBlue.hidden=true;
        self.rlabel.hidden=true;
        self.glabel.hidden=true;
        self.blabel.hidden=true;
    } else {
        NSLog(@"its off!");
        self.lbColor.hidden=false;
        self.circle.hidden=false;
        self.lbRed.hidden=false;
        self.lbGreen.hidden=false;
        self.lbBlue.hidden=false;
        self.slRed.hidden=false;
        self.slGreen.hidden=false;
        self.slBlue.hidden=false;
        self.rlabel.hidden=false;
        self.glabel.hidden=false;
        self.blabel.hidden=false;
    }
}

@end
