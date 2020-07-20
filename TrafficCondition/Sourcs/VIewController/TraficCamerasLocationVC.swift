//
//  ViewController.swift
//  TrafficCondition
//
//  Created by Ishaq on 7/19/20.
//  Copyright © 2020 Ishaq. All rights reserved.
//

import UIKit
import MapKit

class TraficCamerasLocationVC: BaseViewController , TraficCameraLocaitionsViewDelegate {
    
    // MARK: - Properties
    
    var cameraLocationVM:TraficCamerasLocationViewModel = TraficCamerasLocationViewModel()
    var traficCameraLocaitionsView:TraficCameraLocaitionsView?

    // MARK: - ViewController Hirarchy

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = Constants.CameraCaptureVCNavigationTitle
        self.traficCameraLocaitionsView = self.view as? TraficCameraLocaitionsView
        self.traficCameraLocaitionsView?.delegate = self
        self.cameraLocationVM.traficCameraLocationsView = self.traficCameraLocaitionsView

        self.loadTraficCameraLocations(timeStamp:Utilities().generateCurrentTimeStamp(date: Date()))
    }
    
    //  Call view model to load data from server

    
    func loadTraficCameraLocations(timeStamp:String)  {
        self.showLoader()
        
        self.cameraLocationVM.loadTraficCameraFeed(timeStamp: timeStamp){
         (success, errorString) -> Void in
            self.hideLoader()
            if success {
            }else{
                self.showErrorAlert(title: Constants.OK, message: errorString)
            }
        }
    }
    
    // MARK: - TraficCameraLocaitionsView Delegates
    
    func refreshTraficCameraLocations(timeStamp: String){
        self.loadTraficCameraLocations(timeStamp: timeStamp)
    }
    
    func mapViewPinDidSelected(index: Int) {
        let traficCameraPhotoVC = Utilities().instantiateViewController(identifier: Constants.TraficCameraPhotoVCIdentifier) as! TraficCameraPhotoVC
        traficCameraPhotoVC.traficCamera = self.cameraLocationVM.traficCameras[index]
        self.navigationController?.pushViewController(traficCameraPhotoVC, animated: true)
    }
}



