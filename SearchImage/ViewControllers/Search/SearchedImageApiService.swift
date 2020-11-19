//
//  SearchedImageApiService.swift
//  SearchImage
//
//  Created by HYUNSEUNG LEE on 2020/11/19.
//

import Foundation
import SwiftyJSON
import RxSwift


class SearchedImageApiService{
    
    let fetcher: NetworkingProtocol
    
    init(fetcher: NetworkingProtocol){
        self.fetcher = fetcher
    }
    
    func getSearchedImage(image: String) -> Observable<[SearchResultsCellViewModel]>{
        return fetcher.fetchSearchedImage(forImageId: image, response: parseJson)
    }
    
    func getSearchedImage(imageID: String) -> Observable<Data> {
        return fetcher.fetchImage(forImageId: imageID)
    }
    
    private func parseJson(json: Any) -> Observable<[SearchResultsCellViewModel]>{
        
        guard let searchedImage = SearchResults(json: JSON(json)) else {
            return Observable.never()
        }
        
        let viewModels = searchedImage.documents.map{
            SearchResultsCellViewModel(image: $0, api: self)
        }
        
        return Observable.from(optional: viewModels)
    }
}
