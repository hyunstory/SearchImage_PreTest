//
//  SearchedImageViewCell.swift
//  SearchImage
//
//  Created by HYUNSEUNG LEE on 2020/11/19.
//

import UIKit
import RxCocoa
import RxSwift

class SearchedImageViewCell: UITableViewCell{
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var display_sitename: UILabel!
    @IBOutlet weak var isChecked: UISwitch!
    
    // MARK: - Fields
    
    var disposeBag: DisposeBag?
    
    
    
    
    // MARK: - Properties
    
    var viewModel: SearchResultsCellViewModel? {
        didSet{
            let disposeBag = DisposeBag()
            
            
            guard let viewModel = viewModel else {
                return
            }
            display_sitename.text = viewModel.display_sitename
            
            (self.isChecked.rx.value <->
                viewModel.isChecked).disposed(by: disposeBag)
            viewModel.ImageIcon
                .map(UIImage.init)
                .bind(to: iconView.rx.image)
                .disposed(by: disposeBag)
            
            self.disposeBag = disposeBag
        }
    }
}
