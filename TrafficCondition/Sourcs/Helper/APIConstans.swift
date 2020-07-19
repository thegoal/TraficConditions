//
//  APIConstans.swift
//  TrafficCondition
//
//  Created by stella on 7/19/20.
//  Copyright © 2020 Ishaq. All rights reserved.
//

import UIKit

struct APIConstants {
    let baseURLString = "https://api.data.gov.sg/v1/transport/traffic-images"
    
    func cameraLocationURL(timeStamp:String) -> URL{
        var urlComps = URLComponents(string: baseURLString)!
        urlComps.queryItems = [URLQueryItem(name: QueryStrings.date_time as String, value: timeStamp)]
        return urlComps.url!
    }
}

