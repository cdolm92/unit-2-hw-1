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


@interface VenueMapViewController ()


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
    

    
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude: self.lmLat
                                                            longitude: self.lmLng
                                                                 zoom:15];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.myLocationEnabled = YES;
    self.view = mapView_;
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(  self.lmLat,self.lmLng);
    marker.title = self.venueTitle;
    marker.snippet = self.venuePlace;
    marker.map = mapView_;
}

@end
