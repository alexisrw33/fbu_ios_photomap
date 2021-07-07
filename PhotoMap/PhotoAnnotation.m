//
//  PhotoAnnotation.m
//  PhotoMap
//
//  Created by Alexis Rojas-Westall on 7/7/21.
//  Copyright © 2021 Codepath. All rights reserved.
//

#import "PhotoAnnotation.h"

@interface PhotoAnnotation()

@property (nonatomic) CLLocationCoordinate2D coordinate;

@end

@implementation PhotoAnnotation

- (NSString *)title {
    return [NSString stringWithFormat:@"%f", self.coordinate.latitude];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
     MKPinAnnotationView *annotationView = (MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"Pin"];
     if (annotationView == nil) {
     annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"Pin"];
     annotationView.canShowCallout = true;
     annotationView.leftCalloutAccessoryView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 50.0, 50.0)];
     annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
     }

     UIImageView *imageView = (UIImageView*)annotationView.leftCalloutAccessoryView;
     // imageView.image = [UIImage imageNamed:@"camera-icon"]; // remove this line

     // add these two lines below
     PhotoAnnotation *photoAnnotationItem = annotation; // refer to this generic annotation as our more specific PhotoAnnotation
     imageView.image = photoAnnotationItem.photo; // set the image into the callout imageview

     return annotationView;
}

@end
