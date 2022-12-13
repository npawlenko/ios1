//
//  ViewController.m
//  zad1
//
//  Created by np on 06/12/2022.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)addItemViewController:(SecondViewController *)controller didFinishEnteringItem:(NSString *)item {
    NSLog(@"This was returned from SecondView controller %@", item);
    self.surnameTextField.text = item;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"sendSurnameSegue"]) {
        SecondViewController *controller = (SecondViewController *) segue.destinationViewController;
        controller.surname = self.surnameTextField.text;
        controller.delegate = self;
    }
}

- (IBAction)enter:(id)sender {
    NSString *yourName = self.nameTextField.text;
    NSString *myName = @"Norbert";
    NSString *message;
    
    if([yourName length] == 0) {
        message = @"World";
    }
    else if([yourName isEqualToString:myName]) {
        message = [NSString stringWithFormat:@"Hello %@. We have the same name :)", yourName];
    }
    else {
        message = [NSString stringWithFormat:@"Hello %@!", yourName];
    }
    
    self.nameLabel.text = message;
}


@end
