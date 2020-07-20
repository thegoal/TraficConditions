//
//  TraficCameraLocationService.swift
//  TrafficCondition
//
//  Created by stella on 7/20/20.
//  Copyright © 2020 Ishaq. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

typealias CompletionHandler = (_ success:Bool , _ responseObject:Array<TraficCamera>) -> Void


class TraficCameraLocationService: NSObject {
    
    func loadTraficCameraFeedForTimeStamp(timeStamp:String , completion: @escaping CompletionHandler ) {
                
        Alamofire.request(APIConstants().cameraLocationURL(timeStamp: timeStamp) as URL, method: .get).responseArray(keyPath: "items") { (response:DataResponse<[DataItems]>) in
            
             if response.error == nil {
                DispatchQueue.main.async {
                    if let dataItems = response.result.value {
                        if dataItems.count > 0  {
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
