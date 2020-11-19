//
//  SearchResults.swift
//  SearchImage
//
//  Created by HYUNSEUNG LEE on 2020/11/19.
//

import Foundation
import SwiftyJSON

class SearchResults{
    let documents: [SearchedImages]
    
    init?(json: JSON){
        guard
            let list = json["documents"].array
            else {
            return nil
        }
        self.documents = list.compactMap(SearchedImages.init)
    }
    
    
}
