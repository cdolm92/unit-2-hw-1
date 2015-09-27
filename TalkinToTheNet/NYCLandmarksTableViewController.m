//
//  NYCLandmarksTableViewController.m
//  TalkinToTheNet
//
//  Created by Christella on 9/26/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "NYCLandmarksTableViewController.h"
#import "APIManager.h"
#import "NYCLandmarkVenue.h"
#import "NYCLandmarkVenueTableViewCell.h"

@interface NYCLandmarksTableViewController ()

@property (nonatomic) NSMutableArray *nycLandmarkResults;

@end

@implementation NYCLandmarksTableViewController

- (void)fetchFourSquareData {
    
    // create an instagram url
    NSURL *foursquaredURL = [NSURL URLWithString:@"https://api.foursquare.com/v2/venues/search?near=nyc&categoryId=4bf58dd8d48988d12d941735&v=20150214&m=foursquare&client_secret=NGQC00NCHF3FC5J3R3JSBRF3RAWZUAAMFVY25AR5WRLBGM0X&client_id=IQI1WCI0PYHPRKUWXVII2IGMIPXOIPI4A54ZDBOIHUZFDKDO"];
    
    // fetch data from the instagram endpoint and print json response
    [APIManager GETRequestWithURL:foursquaredURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        NSArray *venues = json[@"response"][@"venues"];
        
        // reset my array
        self.nycLandmarkResults = [[NSMutableArray alloc] init];
        
        // loop through all json posts
        for (NSDictionary *venue in venues) {
            
            // create new post from json
            NYCLandmarkVenue *post = [[NYCLandmarkVenue alloc] initWithJSON:venue];
            
            // add post to array
            [self.nycLandmarkResults addObject:post];
        }
        
        [self.tableView reloadData];
    }];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchFourSquareData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.nycLandmarkResults.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NYCLandmarkVenueTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    NYCLandmarkVenue *post = self.nycLandmarkResults[indexPath.row];
    
    cell.landmarkName.text = [NSString stringWithFormat:@"%@",post.venueName];
    cell.landmarkAddress.text = [NSString stringWithFormat:@"@%@",post.venueAddress];
    
    return cell;
}





@end
