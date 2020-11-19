//
//  NetworkingProtocol.swift
//  SearchImage
//
//  Created by HYUNSEUNG LEE on 2020/11/19.
//

import Foundation
import RxSwift

protocol NetworkingProtocol {
    
    func fetchSearchedImage(forImageId name: String, response: @escaping (Any) -> Observable<[SearchResultsCellViewModel]>) -> Observable<[SearchResultsCellViewModel]>
    
    func fetchImage(forImageId id: String) -> Observable<Data>
}
