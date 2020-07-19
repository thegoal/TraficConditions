//
//  MapPinDetailVC.swift
//  TrafficCondition
//
//  Created by stella on 7/19/20.
//  Copyright © 2020 Ishaq. All rights reserved.
//

import UIKit
import SDWebImage

class CameraCaptureVC: BaseViewController {

    var traficCamera:TraficCamera?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Trafic Photo"
        (self.view as? TraficPhotoView)!.showTraficCameraPhoto(traficCamera: self.traficCamera!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
