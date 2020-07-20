//
//  AnnotationView.swift
//  TrafficCondition
//
//  Created by Ishaq on 7/20/20.
//  Copyright © 2020 Ishaq. All rights reserved.
//

import UIKit
import MapKit

class AnnotationView: MKAnnotationView {
    public var pinIndex: Int?  // To cehck which pin is clicked
    public var pinImage : UIImageView?

       override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
           super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
           self.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
           self.pinImage = UIImageView(frame: self.frame)
           self.pinImage?.image = UIImage(named: "icn_pin")
           self.addSubview(self.pinImage!)
       }

       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }

}
