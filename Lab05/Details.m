//
//  Details.m
//  Lab05
//
//  Created by Luis de Jesus Martin Castillo on 28/06/16.
//  Copyright © 2016 Luis de Jesus Martin Castillo. All rights reserved.
//

#import "Details.h"

@interface Details ()

@end

@implementation Details

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initController{
    _titleDetails.text = _destinationTitle;
    _descriptionDetails.text = _destinationDescription;
    _imageDetails.image = [UIImage imageNamed:_destinationPhoto];
}
@end
