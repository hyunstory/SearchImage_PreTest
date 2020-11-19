//
//  AlamofireNetworking.swift
//  SearchImage
//
//  Created by HYUNSEUNG LEE on 2020/11/19.
//

import Foundation
import Alamofire
import RxAlamofire
import RxSwift

struct AlamofireNetworking: NetworkingProtocol {
    func fetchImage(forImageId id: String) -> Observable<Data>{
        return RxAlamofire
            .request(.get, id + ".jpeg")
            .data()
    }
    
    func fetchSearchedImage(forImageId name: String, response: @escaping (Any) -> Observable<[SearchResultsCellViewModel]>) -> Observable<[SearchResultsCellViewModel]>{
        
        
        
        let header: HTTPHeaders = ["Authorization": API.apiKey]
        
        let params: [String : Any] = [
        
            "query": name,
            "sort" : "accuracy",
            "page" : 1,
            "size" : 10
        ]
        
        return RxAlamofire
            .json(.get, Endpoints.Images.fetch.url, parameters: params, headers: header)
            .flatMap(response)
    }
}
