//
//  Slide.swift
//  Horoscope
//
//  Created by Roman on 14.01.2021.
//

import UIKit

class Slide: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
//        addSubview(imageView)
        addSubview(labelDescription)
        
//        imageView.fillSuperview()
        labelDescription.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        labelDescription.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    let imageView: UIImageView = {
       let image = UIImageView()
        return image
    }()
    
    
    let labelDescription: UILabel = {
        let label = UILabel()
        return label
    }()
    
}
