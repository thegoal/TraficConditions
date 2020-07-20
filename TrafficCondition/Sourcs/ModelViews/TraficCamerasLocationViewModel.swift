//
//  MapViewModel.swift
//  TrafficCondition
//
//  Created by Ishaq on 7/19/20.
//  Copyright © 2020 Ishaq. All rights reserved.
//

import MapKit
import Foundation
import Alamofire
import AlamofireObjectMapper

// Block will tell view controller about success and failure of web api so that loader can be hide

typealias TraficCameraLocationResponseSucess = (_ success:Bool, _ error:String) -> Void


class TraficCamerasLocationViewModel {

    
    var traficCameraLocationsView:TraficCameraLocaitionsView?
    var traficCameras:[TraficCamera] = []
    
    // Creating annottion and setting to mapview for loading on
    
    func createAnnotationsForMapView() {
        var annotatonsArray:[Annotation] = []
        for (index, traficCamera) in self.traficCameras.enumerated() {
            let coordinate = CLLocationCoordinate2D(latitude: traficCamera.location!.latitude!,
                                                              longitude: traficCamera.location!.longitude!)
            let annotation = Annotation()
            annotation.coordinate = coordinate
            annotation.index = index
            annotatonsArray.append(annotation)
        }
        if let annotations = self.traficCameraLocationsView?.mapView?.annotations {
            self.traficCameraLocationsView?.mapView?.removeAnnotations(annotations)
        }
        traficCameraLocationsView?.mapView?.showAnnotations(annotatonsArray, animated: true)
    }

    func loadTraficCameraFeed( timeStamp:String , traficCameraLocationResponseSucess: @escaping TraficCameraLocationResponseSucess ) {
        TraficCameraLocationService().loadTraficCameraFeedForTimeStamp(timeStamp: timeStamp )
        {( success , responseObject) -> Void in
            if success {
                    self.traficCameras = responseObject
                    self.createAnnotationsForMapView()
                    traficCameraLocationResponseSucess(true , "")
            }else{
                traficCameraLocationResponseSucess(false , Constants.GenericErrorMessage)
            }
        }
    }
}
