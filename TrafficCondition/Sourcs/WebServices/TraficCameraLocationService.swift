//
//  TraficCameraLocationService.swift
//  TrafficCondition
//
//  Created by Ishaq on 7/20/20.
//  Copyright © 2020 Ishaq. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

typealias CompletionHandler = (_ success:Bool , _ responseObject:Array<TraficCamera>) -> Void


class TraficCameraLocationService: NSObject {
    
    func loadTraficCameraFeedForTimeStamp(timeStamp:String , completion: @escaping CompletionHandler ) {
        
        // Loading data from server , "items" is the the json key from which mapper will start mapping
        
                
        Alamofire.request(APIConstants().cameraLocationURL(timeStamp: timeStamp) as URL, method: .get).responseArray(keyPath: "items") { (response:DataResponse<[DataItems]>) in
            
             if response.error == nil {
                DispatchQueue.main.async {
                    if let dataItems = response.result.value {
                        if dataItems.count > 0  {
                            // Sending camera array to modelview so it can be processed and show on map
                            completion(true,dataItems[0].cameras! )
                        }
                    }
                }
             }else {
                 DispatchQueue.main.async {
                     completion(false, [] )
                 }
             }
        }
    }
}
