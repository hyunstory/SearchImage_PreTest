//
//  SearchResultsCellViewModel.swift
//  SearchImage
//
//  Created by HYUNSEUNG LEE on 2020/11/19.
//

import Foundation
import RxSwift
import RxCocoa


class SearchResultsCellViewModel: SearchResultsCellViewModelType{
    
    
    // MARK: Input
    let isChecked = BehaviorRelay<Bool>(value: false)
    
    
    // MARK: Output
    
    var ImageIcon: Observable<Data> = Observable.just(Data())
    
    // MARK: Properties
    private let apiService: SearchedImageApiService
    private var iconId: String
    var display_sitename: String
    
    init(image: SearchedImages, api: SearchedImageApiService){
        
        self.display_sitename = "\(image.display_sitename)"
        self.apiService = api
        self.iconId = image.image_url
        
        getIconAsync()
    }
    
    deinit{
        print("SearchResultsCellViewModel deinit called")
    }
    
    private func getIconAsync(){
        ImageIcon = apiService.getSearchedImage(imageID: iconId)
    }
}
