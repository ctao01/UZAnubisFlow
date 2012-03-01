//
//  PlaceZombie.h
//  AnubisFlow
//
//  Created by Joy Tao on 10/19/11.
//  Copyright 2011 NYU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>



@interface PlaceZombie : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    UITableView * groupTV;
    MKMapView *  mapView;
    
}

@end
