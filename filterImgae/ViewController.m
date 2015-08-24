//
//  ViewController.m
//  ImgaeBG-change filter
//
//  Created by Sathish Chinniah on 22/08/15.
//  Copyright (c) 2015 sathish chinniah. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

//- (IBAction)filter:(UISlider *)sender;




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

- (IBAction)filter:(UISlider *)sender {
    
    CIImage *beginImage = [CIImage imageWithData: UIImagePNGRepresentation(self.imageView.image)];
    
    CIContext *context = [CIContext contextWithOptions:nil];
    
    CIFilter *filter = [CIFilter filterWithName:@"CISepiaTone"
                                  keysAndValues: kCIInputImageKey, beginImage,
                        @"inputIntensity", [NSNumber numberWithFloat:sender.value], nil];
    
    CIImage *outputImage = [filter outputImage];
    
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
    
    self.imageView.image = [UIImage imageWithCGImage:cgimg];
    
    CGImageRelease(cgimg);
    
    if (sender.value == 0)
    {
        self.imageView.image = [UIImage imageNamed:@"www"];
    }
    
    
}
@end