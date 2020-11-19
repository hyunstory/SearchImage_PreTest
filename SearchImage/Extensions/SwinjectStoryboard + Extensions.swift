//
//  SwinjectStoryboard + Extensions.swift
//  SearchImage
//
//  Created by HYUNSEUNG LEE on 2020/11/20.
//

import SwinjectStoryboard

extension SwinjectStoryboard {
    
    @objc class func setup() {
        
        defaultContainer.storyboardInitCompleted(SearchedImageViewController.self) { r, c in
            c.api = r.resolve(SearchedImageApiService.self)
        }
        
        defaultContainer.register(NetworkingProtocol.self) { _ in AlamofireNetworking() }
        
        defaultContainer.register(SearchedImageApiService.self) { r in
            SearchedImageApiService(fetcher: r.resolve(NetworkingProtocol.self)!)
        }
    }
}
