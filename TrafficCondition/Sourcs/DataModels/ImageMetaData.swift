//
//  ImageMetaData.swift
//  TrafficCondition
//
//  Created by Ishaq on 7/19/20.
//  Copyright © 2020 Ishaq. All rights reserved.
//

import Foundation
import ObjectMapper


class ImageMetadata : NSObject, NSCoding, Mappable{

    var height : Int?
    var md5 : String?
    var width : Int?

    class func newInstance(map: Map) -> Mappable?{
        return ImageMetadata()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        height <- map[ResponseStrings.height]
        md5 <- map[ResponseStrings.md5]
        width <- map[ResponseStrings.width]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         height = aDecoder.decodeObject(forKey: ResponseStrings.height) as? Int
         md5 = aDecoder.decodeObject(forKey: ResponseStrings.md5) as? String
         width = aDecoder.decodeObject(forKey: ResponseStrings.width) as? Int

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if height != nil{
            aCoder.encode(height, forKey: ResponseStrings.height)
        }
        if md5 != nil{
            aCoder.encode(md5, forKey: ResponseStrings.md5)
        }
        if width != nil{
            aCoder.encode(width, forKey: ResponseStrings.width)
        }

    }

}
