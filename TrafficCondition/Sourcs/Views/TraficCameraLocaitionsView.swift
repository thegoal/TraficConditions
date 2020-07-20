//
//  TraficCameraView.swift
//  TrafficCondition
//
//  Created by Ishaq on 7/19/20.
//  Copyright © 2020 Ishaq. All rights reserved.
//

import UIKit
import MapKit
import DatePickerDialog


//    MARK: - TraficCameraLocaitionsView Delegate to inform View Controller for Pin select event

protocol  TraficCameraLocaitionsViewDelegate  {
    func mapViewPinDidSelected(index: Int)
    func refreshTraficCameraLocations(timeStamp: String)
}


class TraficCameraLocaitionsView: UIView , MKMapViewDelegate {
    
    //    MARK: - Properties

    var delegate : TraficCameraLocaitionsViewDelegate?
    @IBOutlet var mapView: MKMapView?
    let datePicker = DatePickerDialog(
           textColor: .black,
           buttonColor: .systemBlue,
           font: UIFont.boldSystemFont(ofSize: 16),
           showCancelButton: true
       )
    
    //    MARK: - IBActions
    
    @IBAction func refreshTraficCameraLoactions(){
        self.delegate?.refreshTraficCameraLocations(timeStamp: Utilities().generateCurrentTimeStamp(date: Date()))
    }
    
    // Show date picker to selct date and time for trafic camera feed
    
    @IBAction func showDatePicker(){
        datePicker.show("DatePicker", doneButtonTitle: "Done", cancelButtonTitle: "Cancel",maximumDate: Date(), datePickerMode: .dateAndTime) {
            (date) -> Void in
            if let dt = date {
                self.delegate?.refreshTraficCameraLocations(timeStamp: Utilities().generateCurrentTimeStamp(date: dt))
            }
        }
    }
    
//    MARK: - MKMapView DataSource and Delegate
    
    public func mapView(_ mapView: MKMapView,
                         viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var pinView: AnnotationView
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: Constants.AnnotationPinIdentifier) as? AnnotationView {
                    dequeuedView.annotation = annotation;
                    pinView = dequeuedView;
        }else{
            pinView = AnnotationView(annotation: annotation, reuseIdentifier: Constants.AnnotationPinIdentifier);
        }
        
        pinView.canShowCallout = false ;
        // Index will help getting Trafic object on selection
        pinView.pinIndex = (annotation as! Annotation).index
        return pinView;
     }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        // On selection informing Controller for showing pin detail
        self.delegate?.mapViewPinDidSelected(index: (view as! AnnotationView).pinIndex!)
    }
    
}
