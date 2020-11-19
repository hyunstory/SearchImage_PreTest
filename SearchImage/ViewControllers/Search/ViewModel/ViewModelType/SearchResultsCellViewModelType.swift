//
//  SearchResultsCellViewModelType.swift
//  SearchImage
//
//  Created by HYUNSEUNG LEE on 2020/11/19.
//

import Foundation
import RxCocoa
import RxSwift

protocol SearchResultsCellViewModelType {
    
    // MARK: Input
    var isChecked: BehaviorRelay<Bool> { get }
    
    // MARK: Output
    var ImageIcon: Observable<Data> { get }
}
