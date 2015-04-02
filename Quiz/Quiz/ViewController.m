//
//  ViewController.m
//  Quiz
//
//  Created by Chioukh Lyes on 02/04/2015.
//  Copyright (c) 2015 Excilys. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (nonatomic) int currentQuestionIndex;
@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;


@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

@end

@implementation ViewController


- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
    // Call the init method implemented by the superclass
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Create two arrays filled with questions and answers
        // and make the pointers point to them
        self.questions = @[@"Quelle boisson est-il recommandé de consommer au cours et en dehors des repas ?",
                           @"Quel est le nombre de personnes habitant en France ?",
                           @"Quelle est la capitale de la France ?",
                           @"Quelle est la capitale et la plus grande ville de l'Espagne ?",
                           @"RMA vs FCB ! qui gagne ?"
                           
                           ];
        self.answers = @[@"L’eau.",
                         @"Estimé à 67 millions.'",
                         @"Paris",
                         @"Madrid",
                         @"RMA, of course <3 !"
                         
                         ];
        // Return the address of the new object
    }
    return self;
}



- (IBAction)showQuestion:(id)sender
{
    // Step to the next question
    self.currentQuestionIndex++;
    // Am I past the last question?
    if (self.currentQuestionIndex == [self.questions count]) {
        // Go back to the first question
        self.currentQuestionIndex = 0;
    }
    // Get the string at that index in the questions array
    NSString *question = self.questions[self.currentQuestionIndex];
    // Display the string in the question label
    self.questionLabel.text = question;
    // Reset the answer label
    self.answerLabel.text = @"?";
}
- (IBAction)showAnswer:(id)sender
{
    // What is the answer to the current question?
    NSString *answer = self.answers[self.currentQuestionIndex];
    // Display it in the answer label
    self.answerLabel.text = answer;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
