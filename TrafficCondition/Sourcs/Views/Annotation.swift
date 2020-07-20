//
//  AnnotationHelper.swift
//  TrafficCondition
//
//  Created by stella on 7/19/20.
//  Copyright © 2020 Ishaq. All rights reserved.
//

import UIKit
import MapKit

class Annotation : NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title:String?
    var index:Int?
    
    override init() {
        self.coordinate = CLLocationCoordinate2D()
    }
}

