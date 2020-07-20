//
//  ViewController.swift
//  TrafficCondition
//
//  Created by stella on 7/19/20.
//  Copyright © 2020 Ishaq. All rights reserved.
//

import UIKit
import MapKit

class CamerasLocationVC: BaseViewController , TraficCameraLocaitionsViewDelegate {
    // MARK: - Properties
    var cameraLocationVM:CamerasLocationViewModel = CamerasLocationViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Trafic Camera Locations"
        self.cameraLocationVM.traficCameraLocationsView = self.view as? TraficCameraLocaitionsView
        self.cameraLocationVM.traficCameraLocationsView?.delegate = self

        self.loadTraficCameraLocations()
    }
    
    func loadTraficCameraLocations()  {
        self.showLoader()
        cameraLocationVM.loadTraficCameraFeed(traficCameraLocationResponseSucess:){ (success, errorString) -> Void in
            if success {
                self.hideLoader()
            }else{
                self.showErrorAlert(title: "OK", message: errorString)
            }
        }
    }
    
    @IBAction func refreshTraficCameraLoactions(){
        self.loadTraficCameraLocations()
    }
    
    func mapViewPinDidSelected(index: Int) {
        let cameraCaptureVC = Utilities().instantiateViewController(identifier: "CameraCaptureVC") as! CameraCaptureVC
        cameraCaptureVC.traficCamera = self.cameraLocationVM.traficCameras[index]
        self.navigationController?.pushViewController(cameraCaptureVC, animated: true)
    }
}



