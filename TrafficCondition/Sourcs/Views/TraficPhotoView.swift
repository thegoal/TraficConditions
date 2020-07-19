//
//  TraficCameraPhotoView.swift
//  TrafficCondition
//
//  Created by stella on 7/19/20.
//  Copyright © 2020 Ishaq. All rights reserved.
//

import UIKit
import SDWebImage


class TraficPhotoView: UIView {
    @IBOutlet weak var traficImage:UIImageView?
    
    func showTraficCameraPhoto(traficCamera:TraficCamera)  {
        self.traficImage?.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.traficImage?.sd_setImage(with: URL(string: traficCamera.image!), completed: nil)
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
