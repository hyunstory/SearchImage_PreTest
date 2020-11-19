//
//  ListViewCell.swift
//  SearchImage
//
//  Created by HYUNSEUNG LEE on 2020/11/20.
//

import UIKit
import RxSwift
import RxCocoa

class ListViewCell: UITableViewCell{
    
    override public func prepareForReuse() {
        super.prepareForReuse()
    }
    
    deinit {
        print("ListViewCell deinit called")
    }
}
