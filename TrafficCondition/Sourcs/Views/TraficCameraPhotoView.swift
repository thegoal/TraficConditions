//
//  TraficCameraPhotoView.swift
//  TrafficCondition
//
//  Created by Ishaq on 7/19/20.
//  Copyright © 2020 Ishaq. All rights reserved.
//

import UIKit
import SDWebImage


class TraficCameraPhotoView: UIView {
    
    @IBOutlet weak var traficImage:UIImageView?
    
    func showTraficCameraPhoto(traficCamera:TraficCamera)  {
        self.traficImage?.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.traficImage?.sd_setImage(with: URL(string: traficCamera.image!), completed: nil)
    }

}
