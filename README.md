# filterImgae
BG color changer Via slider

# ScreenShots

![1](https://cloud.githubusercontent.com/assets/12906173/11507612/da4f1bfc-987a-11e5-81a8-f44f33f728d8.png)
![2](https://cloud.githubusercontent.com/assets/12906173/11507615/dc205162-987a-11e5-8be6-db5a985e1738.png)

# Code

```
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
```
