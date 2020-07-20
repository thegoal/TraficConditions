//
//  BaseViewController.swift
//  TrafficCondition
//
//  Created by Ishaq on 7/19/20.
//  Copyright © 2020 Ishaq. All rights reserved.
//

import UIKit
import ProgressHUD

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Show and Hide loader
    
    func showLoader()   {
        ProgressHUD.show()
    }
    
    func hideLoader()   {
        ProgressHUD.dismiss()
    }
    
    // MARK: - Show error Alert with message and title
    
    func showErrorAlert(title:String,message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle:.alert)
        alert.addAction(UIAlertAction(title: Constants.OK, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
