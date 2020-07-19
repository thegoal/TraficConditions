//
//  ViewController.swift
//  TrafficCondition
//
//  Created by stella on 7/19/20.
//  Copyright © 2020 Ishaq. All rights reserved.
//

import UIKit
import MapKit

class CamerasLocationVC: BaseViewController , MKMapViewDelegate {
    // MARK: - Properties
    @IBOutlet var mapView: MKMapView?
    var traficCameras:[TraficCamera] = []
    var cameraLocationVM:CamerasLocationViewModel = CamerasLocationViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Camera Locations"

        self.mapView?.delegate = self

        self.loadCameraLocations()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
            
    }
    
    func loadCameraLocations()  {
        self.showLoader()
               cameraLocationVM.loadTraficCameraFeedForTimeStamp(timeStamp: Utilities().generateCurrentTimeStamp()){( success , responseObject) -> Void in
                   if success {
                           self.traficCameras = responseObject
                           self.hideLoader()
                           self .addAnnotations()
                   }else{
                       self.showErrorAlert(title: "OK", message: "Something went wrong, Please try again latter!")
                   }
               }
    }
    

     
     private func addAnnotations() {
        var annotatonsArray:[Annotation] = []
        for (index, traficCamera) in self.traficCameras.enumerated() {
            let coordinate = CLLocationCoordinate2D(latitude: traficCamera.location!.latitude!,
                                                       longitude: traficCamera.location!.longitude!)

            let annotation = Annotation()
            annotation.coordinate = coordinate
            annotation.title = "Camera Location"
            annotation.index = index
            annotatonsArray.append(annotation)
        }
        mapView?.showAnnotations(annotatonsArray, animated: true)
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
        let cameraCaptureVC = Utilities().instantiateViewController(identifier: "CameraCaptureVC") as! CameraCaptureVC
        cameraCaptureVC.traficCamera = self.traficCameras[(view as! AnnotationView).pinIndex!]
        self.navigationController?.pushViewController(cameraCaptureVC, animated: true)
    }
}



