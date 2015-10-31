//
//  VenueMapViewController.m
//  TalkinToTheNet
//
//  Created by Christella on 10/13/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "VenueMapViewController.h"
#import "APIManager.h"
#import "NYCLandmarkVenue.h"
@import GoogleMaps;


@interface VenueMapViewController ()<GMSMapViewDelegate>

@property(strong, nonatomic) NSURLSession *markerSession;
@property (nonatomic) NSArray *steps;

@end

@implementation VenueMapViewController
{
    GMSMapView *mapView_;
}

- (void)viewDidLoad {
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    
    
 //  float lat = self.lmLat;
 //  float lon = self.lmLng;
    
    self.tabBarController.tabBar.tintColor = [UIColor colorWithRed:1.0 green:.11 blue:.52 alpha:1.0];

    self.navigationItem.title = self.venueTitle;

    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Press Me" forState:UIControlStateNormal];
    [button sizeToFit];
    button.frame = CGRectMake(160, 240, 35, 10);
    [self.view addSubview:button];
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude: self.lmLat
                                                            longitude: self.lmLng
                                                                 zoom:16.50
                                                             bearing:0
                                                        viewingAngle:0
                                 ];
    
    
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.myLocationEnabled = YES;
    mapView_.settings.compassButton = YES;
    mapView_.settings.myLocationButton = YES;
    self.view = mapView_;
    [mapView_ setMinZoom:12 maxZoom:20];
    
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(  self.lmLat,self.lmLng);
    marker.title = self.venueTitle;
    marker.snippet = self.venuePlace;
    marker.appearAnimation = kGMSMarkerAnimationPop;
    marker.icon = [GMSMarker markerImageWithColor: [UIColor colorWithRed:1.0 green:.11 blue:.52 alpha:1.0]];
    marker.map = mapView_;
}

-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    mapView_.padding = UIEdgeInsetsMake(self.topLayoutGuide.length + 5, 0,
                                        self.bottomLayoutGuide.length + 5, 0);
    
}

-(BOOL)mapView:(GMSMapView *)mapView didTapMarker:(GMSMarker *)marker {
    if (mapView.myLocation != nil) {
        
        NSString *urlString = [NSString stringWithFormat:
                               @"%@?origin=%f, %f&destination=%f, %f&sensor=true&key=%@",
                               @"https://maps.googleapis.com/maps/api/directions/json",
                               mapView_.myLocation.coordinate.latitude,
                               mapView_.myLocation.coordinate.longitude,
                               marker.position.latitude,
                               marker.position.longitude,
                               @"AIzaSyCLhWpn6GAh5H_-PVLy-yeOhi61ePHDJ8Q"];
        NSURL *directionsURL = [NSURL URLWithString:urlString];
        NSURLSessionDataTask *directionsTask = [self.markerSession dataTaskWithURL:directionsURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *e){
            NSError *error = nil;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                                 options: NSJSONReadingMutableContainers
                                                                   error:&error];
            
            if (!error) {
                self.steps = json[@"routes"][0][@"legs"][0][@"steps"];
            }
        
        }];
        [directionsTask resume];
}

return NO;

}


- (void)directionTapped:(id)sender
{
   /* DirectionsVC *directionsVC = [[DirectionsVC alloc] init];
    directionsVC.steps = self.steps;
    [self presentViewController:directionsVC
                       animated:YES
                     completion:^{
                         self.steps = nil;
                         self.mapView.selectedMarker = nil;
                     }];
  
    
    NSLog(@"tapped");
    */
}





@end
