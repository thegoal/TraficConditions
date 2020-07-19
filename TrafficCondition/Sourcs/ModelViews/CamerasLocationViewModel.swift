//
//  MapViewModel.swift
//  TrafficCondition
//
//  Created by stella on 7/19/20.
//  Copyright © 2020 Ishaq. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper


typealias CompletionHandler = (_ success:Bool , _ responseObject:Array<TraficCamera>) -> Void

class CamerasLocationViewModel: NSObject {
    
    var traficCameras:[TraficCamera] = []
    

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


//Alamofire.request(URL).responseObject(keyPath: "data") { (response: DataResponse<WeatherResponse>) in
//    expectation.fulfill()
//
//    let weatherResponse = response.result.value
//    print(weatherResponse?.location)
//
//    if let threeDayForecast = weatherResponse?.threeDayForecast {
//        for forecast in threeDayForecast {
//            print(forecast.day)
//            print(forecast.temperature)
//        }
//    }
//}
