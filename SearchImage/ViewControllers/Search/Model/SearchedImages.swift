//
//  SearchedImages.swift
//  SearchImage
//
//  Created by HYUNSEUNG LEE on 2020/11/19.
//

import Foundation
import SwiftyJSON


class SearchedImages{
    let display_sitename: String
    let height: Int
    let width: Int
    let image_url: String
    let thumbnail_url: String
    
    
    init?(json: JSON){
        guard
            let display_sitename = json["display_sitename"].string,
            let height = json["height"].int,
            let width = json["width"].int,
            let image_url = json["image_url"].string,
            let thumbnail_url = json["thumbnail_url"].string
        
        else {
            return nil
        }
        
        self.display_sitename = display_sitename
        self.height = height
        self.width = width
        self.image_url = image_url
        self.thumbnail_url = thumbnail_url
        
    }
}
