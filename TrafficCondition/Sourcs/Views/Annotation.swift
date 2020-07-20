//
//  AnnotationHelper.swift
//  TrafficCondition
//
//  Created by Ishaq on 7/19/20.
//  Copyright © 2020 Ishaq. All rights reserved.
//

import UIKit
import MapKit

class Annotation : NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var index:Int? // To cehck which pin is clicked
    
    override init() {
        self.coordinate = CLLocationCoordinate2D()
    }
}

