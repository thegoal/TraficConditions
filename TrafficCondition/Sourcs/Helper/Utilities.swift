//
//  Utilities.swift
//  TrafficCondition
//
//  Created by Ishaq on 7/19/20.
//  Copyright © 2020 Ishaq. All rights reserved.
//

import UIKit

class Utilities: NSObject {
    func generateCurrentTimeStamp (date:Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormates.yy_mm_dd_hh_mm_ss
        return (formatter.string(from: date) as NSString) as String
    }
    
    func instantiateViewController(identifier:String) -> UIViewController {
        let storyBoard : UIStoryboard = UIStoryboard(name: Constants.MainStoryBoard, bundle:nil)
        return storyBoard.instantiateViewController(withIdentifier: identifier)
    }
}
