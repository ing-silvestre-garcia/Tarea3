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
    
    NSString *hex;
    
    hexred=[self formatHex:hexred];
    hexgreen=[self formatHex:hexgreen];
    hexblue=[self formatHex:hexblue];
    hex = [NSString stringWithFormat:@"%@%@%@",hexred,hexgreen,hexblue ];
    self.txtColor.text=hex;
    
}

-(NSString*) formatHex:(NSString*)hex{
    int len = [hex length];
    if(len==1){
        hex = [NSString stringWithFormat:@"%@%@",@"0",hex ];
    }
    return hex;
}

- (IBAction)changeRed:(id)sender {
    [self refreshColor];
}

- (IBAction)changeAlpha:(id)sender {
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


@end
