//
//  SearchResultsListViewModelType.swift
//  SearchImage
//
//  Created by HYUNSEUNG LEE on 2020/11/19.
//

import Foundation
import RxCocoa
import RxSwift

protocol SearchResultsListViewModelType {
    // MARK: Input
    var showCheckedButtonDidTap: PublishSubject<Void> { get }
    var searchText: BehaviorRelay<String> { get }
    
    // MARK: Output
    
    var message: Observable<String> { get }
    var images: Observable<[SearchResultsCellViewModel]> { get }
    var isLoading: Observable<Bool> { get }
    var error: Observable<Error> { get }
}
