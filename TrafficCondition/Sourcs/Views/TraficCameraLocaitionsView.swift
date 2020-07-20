//
//  TraficCameraView.swift
//  TrafficCondition
//
//  Created by stella on 7/19/20.
//  Copyright © 2020 Ishaq. All rights reserved.
//

import UIKit
import MapKit

protocol  TraficCameraLocaitionsViewDelegate  {
    func mapViewPinDidSelected(index: Int)
}


class TraficCameraLocaitionsView: UIView , MKMapViewDelegate {
    
    var delegate : TraficCameraLocaitionsViewDelegate?
    @IBOutlet var mapView: MKMapView! {
        didSet{
//            self.mapView.delegate = self
        }
    }
    
    
    
    public func mapView(_ mapView: MKMapView,
                         viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let ann = annotation as! Annotation
              let pinIdent = "Pin";
              var pinView: AnnotationView;
               if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: pinIdent) as? AnnotationView {
                  dequeuedView.annotation = annotation;
                  pinView = dequeuedView;
              }else{
                   pinView = AnnotationView(annotation: annotation, reuseIdentifier: pinIdent);
                   pinView.pinImage!.image = UIImage(named: "icn_pin")
                   pinView.canShowCallout = false ;
              }
              
               pinView.pinIndex = ann.index
              return pinView;
     }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        self.delegate?.mapViewPinDidSelected(index: (view as! AnnotationView).pinIndex!)
    }
    
}
