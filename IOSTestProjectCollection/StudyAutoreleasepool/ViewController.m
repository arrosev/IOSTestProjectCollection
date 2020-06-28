//
//  ViewController.m
//  StudyAutoreleasepool
//
//  Created by 陈鑫亮 on 2020/6/28.
//  Copyright © 2020 陈鑫亮. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,strong) UIImageView *imageView;

@property(nonatomic,strong) UIImageView *resultImageView;

@end

@implementation ViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configData];
    [self setUI];
    // Do any additional setup after loading the view.
}

- (void)configData {
    
}

- (void)setUI {
    self.imageView.image = [UIImage imageNamed:@"Megumin.png"];
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.resultImageView];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.imageView.frame = self.view.bounds;
    self.resultImageView.frame = self.view.bounds;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //self.resultImageView.image = [self imageFromStitchingUseAutoreleasepool];//使用自动释放池的情况
    self.resultImageView.image = [self imageFromStitchingNotUseAutoreleasepool];//未使用自动释放池的情况
}

- (void)dealloc {
    NSLog(@"-dealloc %@",self);
}

#pragma mark - response method

#pragma mark - public method

#pragma mark - private method
- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (UIImage *)imageFromStitchingUseAutoreleasepool {
    UIImage *resultImage = [self screenShot];
    for(int i = 0; i <= 12; i++) {
        @autoreleasepool {
            UIImage *screenShotImage = [self screenShot];
            resultImage = [self addSlaveImage:screenShotImage toMasterImage:resultImage];
        }
    }
    return resultImage;
}

- (UIImage *)imageFromStitchingNotUseAutoreleasepool {
    UIImage *resultImage = [self screenShot];
    for(int i = 0; i <= 12; i++) {
        UIImage *screenShotImage = [self screenShot];
        resultImage = [self addSlaveImage:screenShotImage toMasterImage:resultImage];
    }
    return resultImage;
}

- (UIImage *)screenShot {
    UIGraphicsBeginImageContextWithOptions(self.view.frame.size, YES, 0.0);
    [self.view drawViewHierarchyInRect:self.view.frame afterScreenUpdates:YES];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)addSlaveImage:(UIImage *)slaveImage toMasterImage:(UIImage *)masterImage {
    CGSize size;
    size.width = masterImage.size.width;
    size.height = masterImage.size.height + slaveImage.size.height;
    UIGraphicsBeginImageContextWithOptions(size, YES, 0.0);
    [masterImage drawInRect:CGRectMake(0, 0, masterImage.size.width, masterImage.size.height)];
    [slaveImage drawInRect:CGRectMake(0, masterImage.size.height, masterImage.size.width, slaveImage.size.height)];
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultImage;
}

#pragma mark - setter & getter

- (UIImageView *)imageView {
    if(!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _imageView;
}

- (UIImageView *)resultImageView {
    if(!_resultImageView) {
        _resultImageView = [[UIImageView alloc] init];
        _resultImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _resultImageView;
}

@end
