//
//  SearchResultsListViewModel.swift
//  SearchImage
//
//  Created by HYUNSEUNG LEE on 2020/11/19.
//

import Foundation
import RxSwift
import RxCocoa

class SearchResultsListViewModel: SearchResultsListViewModelType{
    
    
    // MARK: Input
    var showCheckedButtonDidTap: PublishSubject<Void> = .init()
    var searchText = BehaviorRelay<String>(value: "")
    
    
    // MARK: Output
    var message: Observable<String> = Observable.just("")
    var images: Observable<[SearchResultsCellViewModel]>
    {
        return self.imagesVariable.asObservable()
    }
    
    var isLoading: Observable<Bool>{
        return self.isLoadingVariable.asObservable()
    }
    
    var error: Observable<Error>{
        return self.errorSubject.asObservable()
    }
    
    
    // MARK: Fields
    
    private let isLoadingVariable = BehaviorRelay(value: false)
    private let errorSubject = PublishSubject<Error>()
    private let imagesVariable = BehaviorRelay<[SearchResultsCellViewModel]>(value: [])
    private let apiService: SearchedImageApiService
    private let disposeBag = DisposeBag()
    
    init(api: SearchedImageApiService){
        
        self.apiService = api
        bindObservableToFetchImages()
        bindButtonDidTap()
    }
    
    deinit {
        print("SearchResultsViewModel deinit called")
    }
}


extension SearchResultsListViewModel{
    private func bindObservableToFetchImages(){
        searchText.asObservable()
            .throttle(1, scheduler: MainScheduler.instance)
            .filter { $0.count > 2 }
            .distinctUntilChanged()
            .do(onNext: { [weak self] _ in self?.isLoadingVariable.accept(true) })
            // dif between flatMap and flapMapLatest is that flatMapLatest destroys previous calls from sequence
            .flatMapLatest ({ [weak self] query -> Observable<[SearchResultsCellViewModel]> in
                if let this = self {
                    return this.fetchImagesList(query: query)
                }
            
            return Observable.just([])
        })
        .do(onNext: { [weak self] _ in self?.isLoadingVariable.accept(false) })
        .bind(to: self.imagesVariable)
        .disposed(by: disposeBag)
    }
    
    private func bindButtonDidTap(){
        
        self.message = self.showCheckedButtonDidTap
            .map { [weak self] _ -> String in
                if let this = self{
                    return this.geCheckedItems()
                }
                
                return "There are no checked items"
            }
    }
    
    private func fetchImagesList(query: String) -> Observable<[SearchResultsCellViewModel]>{
        
        if query.isEmpty{
            return Observable.just([])
        }
        
        return apiService
            .getSearchedImage(image: query)
            .catchError {[weak self] error in
                self?.errorSubject.onNext(error)
                return Observable.just([])
            }
    }
    
    private func geCheckedItems() -> String {
        let strings = imagesVariable.value
            .filter { $0.isChecked.value}
            .map { $0.display_sitename}
        
        let message = strings.joined(separator: "\r\n")
        if message == ""{
            return "There are no checked items"
        }
        return message
    }
}
