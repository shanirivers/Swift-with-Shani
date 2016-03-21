//CHAPTER 1 SIMPLE IOS APPLICATION


//
//  ViewController.h
//  Quiz
//
//  Created by Shani on 11/21/15.
//  Copyright © 2015 Shani Rivers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
- (IBAction)btnShowQuestion:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
- (IBAction)btnShowAnswer:(id)sender;

@end

//
//  ViewController.m
//  Quiz
//
//  Created by Shani on 11/21/15.
//  Copyright © 2015 Shani Rivers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) int currentQuestionIndex;

@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnShowQuestion:(id)sender {
    
    self.questions = @[@"From what is cognac made?", @"What is 7 + 7?", @"What is the capital of Vermont?"];
    
        //Am I past the last question?
        if (self.currentQuestionIndex == [self.questions count]) {
            //Go back to the first question
            self.currentQuestionIndex = 0;
        }

        // Get the string at that index in the wuestions array
        NSString *question = self.questions[self.currentQuestionIndex];
    
        //Display the string in the question label
        self.questionLabel.text = question;
    
        // Reset the answer label
        self.answerLabel.text = @"???";
}
- (IBAction)btnShowAnswer:(id)sender {
    
    self.answers = @[@"Grapes", @"14", @"Montpelier"];
    
   //  What's the answer to the current question?
        NSString *answer = self.answers[self.currentQuestionIndex];
    
        //Display it in the answer label
        self.answerLabel.text = answer;
    
    //Step to the next question
        self.currentQuestionIndex++;

}
@end
