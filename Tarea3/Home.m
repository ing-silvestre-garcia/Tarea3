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
NSString *mensajeCirculo;

@interface Home ()

@end

@implementation Home

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self refreshColor];
    self.circle.layer.masksToBounds = true;
    self.circle.layer.cornerRadius= 126 / 2;
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
    
    
    self.circle.backgroundColor=color;
    
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

- (IBAction)switchVisibleValue:(id)sender {
    UISwitch *mySwitch = (UISwitch *)sender;
    if ([mySwitch isOn]) {
        self.circle.hidden=true;
    } else {
        self.circle.hidden=false;
    }
}

- (IBAction)randomColor:(id)sender {
    int randomRed = [self getRandomNumberBetween:0 to:255];
    int randomGreen = [self getRandomNumberBetween:0 to:255];
    int randomBlue = [self getRandomNumberBetween:0 to:255];
    
    self.slRed.value = randomRed;
    self.slGreen.value = randomGreen;
    self.slBlue.value = randomBlue;
    
    [self refreshColor];
}

-(int)getRandomNumberBetween:(int)from to:(int)to {
    
    return (int)from + arc4random() % (to-from+1);
}

- (IBAction)getAlertView:(id)sender {
    if ([self.ocultar isOn]) {
        mensajeCirculo = @"No hay circulo";
    } else {
        NSString *hexred=@"";
        hexred = [NSString stringWithFormat:@"%02lX",
                  (unsigned long)[[@(rcolor) stringValue] integerValue]];
        
        NSString *hexgreen=@"";
        hexgreen = [NSString stringWithFormat:@"%02lX",
                    (unsigned long)[[@(gcolor) stringValue] integerValue]];
        
        NSString *hexblue=@"";
        hexblue = [NSString stringWithFormat:@"%02lX",
                   (unsigned long)[[@(bcolor) stringValue] integerValue]];
        
        hexred=[self formatHex:hexred];
        hexgreen=[self formatHex:hexgreen];
        hexblue=[self formatHex:hexblue];
        hex = [NSString stringWithFormat:@"%@%@%@",hexred,hexgreen,hexblue ];
        
        mensajeCirculo = [NSString stringWithFormat: @"#: %@%@%@",hexred,hexgreen,hexblue];
    }

    NSString *mensajeAlerta = [NSString stringWithFormat: @"Nombre: %@ Telefono:  %@, Circulo: %@",self.txtNombre.text,self.txtTelefono.text,mensajeCirculo];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Alerta"
        message:mensajeAlerta
        preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
    handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

-(NSString*) formatHex:(NSString*)hex{
    int len = [hex length];
    if(len==1){
        hex = [NSString stringWithFormat:@"%@%@",@"0",hex ];
    }
    return hex;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
