//
//  ViewController.m
//  CircleChartDemo
//
//  Created by Anthony Fennell on 3/6/15.
//  Copyright (c) 2015 Anthony Fennell. All rights reserved.
//

#import "ViewController.h"
#import "AFCircleChart.h"

@interface ViewController () <AFCircleChartDelegate>

@property (weak, nonatomic) IBOutlet AFCircleChart *chart2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    CGRect chartRect = CGRectMake(5, 300, 175, 175);
    AFCircleChart *chart1 = [[AFCircleChart alloc] initWithFrame:chartRect];
    [chart1 setLineWidth:22 atValue:337 totalValue:500 chartColor:[UIColor magentaColor]
       descriptionString:@"people"];
    chart1.delegate = self;
    [chart1 animatePath];
    
    
    [self.chart2 setLineWidth:18 atValue:2300 totalValue:3000 chartColor:[UIColor orangeColor]
            descriptionString:@"calories"];
    self.chart2.valuesFontSize = 26;
    self.chart2.descriptionFontSize = 18;
    self.chart2.delegate = self;
    [self.chart2 animatePath];
    
    
    [self.view addSubview:chart1];
}

- (IBAction)redoButtonTapped:(id)sender
{
    int randomTotal = arc4random() % 3000;
    int randomValue = arc4random() % (randomTotal + 100);
    [self.chart2 reAnimateChartAtValue:randomValue totalValue:randomTotal];
}

#pragma mark - AFCircleChart delegate

- (void)touchedCircleChart:(AFCircleChart *)sender
{
    int randomTotal = arc4random() % 3000;
    int randomValue = arc4random() % (randomTotal + 100);
    [sender reAnimateChartAtValue:randomValue totalValue:randomTotal];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
