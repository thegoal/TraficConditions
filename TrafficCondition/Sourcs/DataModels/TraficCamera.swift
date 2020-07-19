//
//  TraficCamera.swift
//  TrafficCondition
//
//  Created by stella on 7/19/20.
//  Copyright © 2020 Ishaq. All rights reserved.
//

import Foundation
import ObjectMapper

class TraficCamera : NSObject, NSCoding, Mappable {

    var cameraId : String?
    var image : String?
    var imageMetadata : ImageMetadata?
    var location : Location?
    var timestamp : String?


    class func newInstance(map: Map) -> Mappable?{
        return TraficCamera()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map) {
        cameraId <- map[ResponseStrings.camera_Id]
        image <- map[ResponseStrings.image]
        imageMetadata <- map[ResponseStrings.image_Metadata]
        location <- map[ResponseStrings.location]
        timestamp <- map[ResponseStrings.timestamp]
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    
    @objc required init(coder aDecoder: NSCoder)
    {
         cameraId = aDecoder.decodeObject(forKey: ResponseStrings.camera_Id) as? String
         image = aDecoder.decodeObject(forKey: ResponseStrings.image) as? String
         imageMetadata = aDecoder.decodeObject(forKey: ResponseStrings.image_Metadata) as? ImageMetadata
         location = aDecoder.decodeObject(forKey: ResponseStrings.location) as? Location
         timestamp = aDecoder.decodeObject(forKey: ResponseStrings.timestamp) as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    
    @objc func encode(with aCoder: NSCoder)
    {
        if cameraId != nil{
            aCoder.encode(cameraId, forKey: ResponseStrings.camera_Id)
        }
        if image != nil{
            aCoder.encode(image, forKey: ResponseStrings.image)
        }
        if imageMetadata != nil{
            aCoder.encode(imageMetadata, forKey: ResponseStrings.image_Metadata)
        }
        if location != nil{
            aCoder.encode(location, forKey: ResponseStrings.location)
        }
        if timestamp != nil{
            aCoder.encode(timestamp, forKey: ResponseStrings.timestamp)
        }

    }

}

