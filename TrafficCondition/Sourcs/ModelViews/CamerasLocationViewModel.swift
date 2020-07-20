//
//  MapViewModel.swift
//  TrafficCondition
//
//  Created by stella on 7/19/20.
//  Copyright © 2020 Ishaq. All rights reserved.
//

import MapKit
import Foundation
import Alamofire
import AlamofireObjectMapper

typealias TraficCameraLocationResponseSucess = (_ success:Bool, _ error:String) -> Void


class CamerasLocationViewModel {
    
    var traficCameraLocationsView:TraficCameraLocaitionsView?
    var traficCameras:[TraficCamera] = []
    
    func addAnnotationsToMapView() {
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
        traficCameraLocationsView?.mapView?.showAnnotations(annotatonsArray, animated: true)
    }

    func loadTraficCameraFeed(traficCameraLocationResponseSucess: @escaping TraficCameraLocationResponseSucess ) {
        TraficCameraLocationService().loadTraficCameraFeedForTimeStamp(timeStamp: Utilities().generateCurrentTimeStamp())
        {( success , responseObject) -> Void in
            if success {
                    self.traficCameras = responseObject
                    self.addAnnotationsToMapView()
                    traficCameraLocationResponseSucess(true , "")
            }else{
                traficCameraLocationResponseSucess(false , "Something went wrong, Please try again latter!")
            }
        }
    }
}
