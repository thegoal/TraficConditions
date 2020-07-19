//
//  AnnotationHelper.swift
//  TrafficCondition
//
//  Created by stella on 7/19/20.
//  Copyright © 2020 Ishaq. All rights reserved.
//

import Foundation
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



class AnnotationView: MKAnnotationView {
    public var pinIndex: Int?
    public var pinImage : UIImageView?

    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        self.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        self.pinImage = UIImageView(frame: self.frame)
        self.pinImage?.image = UIImage(named: "icn_pin.png")
        self.addSubview(self.pinImage!)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
