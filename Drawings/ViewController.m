//
//  ViewController.m
//  Drawings
//
//  Created by Alexey Baryshnikov on 04.06.2020.
//  Copyright © 2020 Alexey Baryshnikov. All rights reserved.
//

#import "ViewController.h"
#import "DrawingView.h"

@class DrawingView;

@interface ViewController ()

@property (nonatomic, weak) IBOutlet DrawingView *drawingView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
}

#pragma mark - Orientation

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [self.drawingView setNeedsDisplay];
}


@end
