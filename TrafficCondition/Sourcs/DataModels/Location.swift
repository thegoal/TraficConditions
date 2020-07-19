//
//  Location.swift
//  TrafficCondition
//
//  Created by stella on 7/19/20.
//  Copyright © 2020 Ishaq. All rights reserved.
//

import Foundation
import ObjectMapper

class Location : NSObject, NSCoding, Mappable{

var latitude : Double?
var longitude : Double?


class func newInstance(map: Map) -> Mappable?{
    return Location()
}
    
    
    
required init?(map: Map){}
private override init(){}

func mapping(map: Map)
{
    latitude <- map[ResponseStrings.latitude]
    longitude <- map[ResponseStrings.longitude]
    
}

/**
* NSCoding required initializer.
* Fills the data from the passed decoder
*/
@objc required init(coder aDecoder: NSCoder)
{
    latitude = aDecoder.decodeObject(forKey: ResponseStrings.latitude) as? Double
    longitude = aDecoder.decodeObject(forKey: ResponseStrings.longitude) as? Double

}

/**
* NSCoding required method.
* Encodes mode properties into the decoder
*/
@objc func encode(with aCoder: NSCoder)
{
    if latitude != nil{
        aCoder.encode(latitude, forKey: ResponseStrings.latitude)
    }
    if longitude != nil{
        aCoder.encode(longitude, forKey: ResponseStrings.longitude)
    }

}
}
