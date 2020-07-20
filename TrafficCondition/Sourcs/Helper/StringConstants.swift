//
//  Constantkeys.swift
//  TrafficCondition
//
//  Created by Ishaq on 7/19/20.
//  Copyright © 2020 Ishaq. All rights reserved.
//

import Foundation

// MARK: - Camera Location Response

struct ResponseStrings {

    static let latitude = "latitude"
    static let longitude = "longitude"
    static let height = "height"
    static let md5 = "md5"
    static let width = "width"
    static let camera_Id = "camera_id"
    static let image = "image"
    static let image_Metadata = "image_metadata"
    static let location = "location"
    static let timestamp = "timestamp"
    static let cameras = "cameras"
}

// MARK: - URL Query Strings

struct QueryStrings {
    
   static let date_time = "date_time"

}

// MARK: - NSDate Formats


struct DateFormates {
    
   static let yy_mm_dd_hh_mm_ss = "yyyy-MM-dd'T'HH:mm:ss"

}

// MARK: - Constants Strings

struct Constants {
    
    static let OK = "OK"
    static let TraficCameraPhotoVCIdentifier =  "TraficCameraPhotoVC"
    static let CameraCaptureVCNavigationTitle =  "Trafic Camera Locations"
    static let TraficCameraPhotoNavigationTitle =  "Trafic Camera Photo"
    static let AnnotationPinIdentifier =  "mapPin"
    static let MainStoryBoard =  "Main"
    static let GenericErrorMessage = "Something went wrong, Please try again latter!"

}



