//
//  Items.swift
//  TrafficCondition
//
//  Created by stella on 7/19/20.
//  Copyright © 2020 Ishaq. All rights reserved.
//

import Foundation
import ObjectMapper

class DataItems : NSObject, NSCoding, Mappable {

   public var cameras : [TraficCamera]?
   var timestamp : String?


   class func newInstance(map: Map) -> Mappable?{
    return DataItems()
   }
    required init?(map: Map){}
    private override init(){}

  

   func mapping(map: Map)
   {
    cameras <- map[ResponseStrings.cameras]
    timestamp <- map[ResponseStrings.timestamp]
       
   }

   /**
   * NSCoding required initializer.
   * Fills the data from the passed decoder
   */
   @objc required init(coder aDecoder: NSCoder)
   {
        cameras = aDecoder.decodeObject(forKey: ResponseStrings.cameras) as? [TraficCamera]
        timestamp = aDecoder.decodeObject(forKey: ResponseStrings.timestamp) as? String

   }

   /**
   * NSCoding required method.
   * Encodes mode properties into the decoder
   */
   @objc func encode(with aCoder: NSCoder)
   {
       if cameras != nil{
           aCoder.encode(cameras, forKey: ResponseStrings.cameras)
       }
       if timestamp != nil{
           aCoder.encode(timestamp, forKey: ResponseStrings.timestamp)
       }

   }

}
