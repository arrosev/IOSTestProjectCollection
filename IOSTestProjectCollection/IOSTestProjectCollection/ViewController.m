//
//  ViewController.m
//  IOSTestProjectCollection
//
//  Created by 陈鑫亮 on 2020/6/28.
//  Copyright © 2020 陈鑫亮. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

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
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    id obj0 = [[NSObject alloc] init];
    id obj1 = [[NSObject alloc] init];
    [obj0 autorelease];
    [obj1 autorelease];
    [pool drain];
}

- (void)setUI {
    
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

- (void)dealloc {
    NSLog(@"-dealloc %@",self);
}

//- (void)cerateAutoreleasepool {
//    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
//    id obj0 = [[NSObject alloc] init];
//    id obj1 = [[NSObject alloc] init];
//    [obj0 autorelease];
//    [obj1 autorelease];
//    [pool drain];
//}

- (void)cerateAutoreleasepool {
    @autoreleasepool {
        id obj0 = [[NSObject alloc] init];
        id obj1 = [[NSObject alloc] init];
    }
}

#pragma mark - response method

#pragma mark - public method

#pragma mark - private method

#pragma mark - setter & getter


@end
