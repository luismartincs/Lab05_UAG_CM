//
//  Details.m
//  Lab05
//
//  Created by Luis de Jesus Martin Castillo on 28/06/16.
//  Copyright © 2016 Luis de Jesus Martin Castillo. All rights reserved.
//

#import "Details.h"
#import "Map.h"

@interface Details ()
    @property NSDictionary *townsLocation;

@end

@implementation Details

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
}

-(void)viewWillAppear:(BOOL)animated{
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:_destinationTitle];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initController{
    _titleDetails.text = _destinationTitle;
    _descriptionDetails.text = _destinationDescription;
    _imageDetails.image = [UIImage imageNamed:_destinationPhoto];
    
    _townsLocation = @{
                       @"San Francisco de Campeche":@[@"19.8365702",@"-90.5384527"],
                       @"Ciudad del Carmen":@[@"18.649167", @"-91.807621"],
                       @"Champotón":@[@"19.346677", @"-90.720442"],
                       @"Palizada":@[@"18.2583257",@"-92.0960948"],
                       @"Xpujil":@[@"18.503036", @"-89.394195"]
                       
                       };
}
- (IBAction)verMapa:(id)sender {
    [self performSegueWithIdentifier:@"Map" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.destinationViewController isKindOfClass:[Map class]]){
        
        Map *destination = [segue destinationViewController];
        destination.latitude = _townsLocation[_destinationTitle][0];
        destination.longitude = _townsLocation[_destinationTitle][1];
        destination.place = _destinationTitle;
        destination.city = _city;
        
    }
}

@end
