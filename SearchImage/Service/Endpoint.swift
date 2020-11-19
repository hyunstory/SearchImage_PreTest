//
//  Endpoint.swift
//  SearchImage
//
//  Created by HYUNSEUNG LEE on 2020/11/19.
//

import Foundation

struct API {
    static let baseUrl = "https://dapi.kakao.com/"
    static let apiKey = ""
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints {
    
    enum Images: Endpoint {
        case fetch
        
        public var path: String{
            switch self {
            case .fetch: return "v2/search/image"
        
            }
        }
        
        public var url: String {
            switch self {
            case .fetch: return "\(API.baseUrl)\(path)"
            }
        }
    }
    
}
