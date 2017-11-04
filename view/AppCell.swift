//
//  AppCell.swift
//  AppStore
//
//  Created by sangita singh on 11/3/17.
//  Copyright © 2017 hulu. All rights reserved.
//

import UIKit

class AppCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor=UIColor.clear
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView :UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named : "appimage")
        image.layer.cornerRadius = 16
        image.layer.masksToBounds = true
        image.translate()
        return image
    }()
    
    let appName : UILabel = {
        let appLabel = UILabel()
        appLabel.textColor = UIColor.black
        appLabel.text = "Home Game - This is a great game"
        appLabel.numberOfLines = 2
        appLabel.translate()
        appLabel.font = UIFont.systemFont(ofSize: 13)
        return appLabel
    }()
    
    let categoryName : UILabel = {
        let appLabel = UILabel()
        appLabel.textColor = UIColor.darkGray
        appLabel.text = "Entertainment"
        appLabel.translate()
        appLabel.font = UIFont.systemFont(ofSize: 13)
        return appLabel
    }()
    
    let priceLabel : UILabel = {
        let appLabel = UILabel()
        appLabel.textColor = UIColor.darkGray
        appLabel.text = "$23.42"
        appLabel.translate()
        appLabel.font = UIFont.systemFont(ofSize: 13)
        return appLabel
    }()
    
    func setUpViews(){
        addSubview(imageView)
        addSubview(appName)
        addSubview(categoryName)
        addSubview(priceLabel)
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
        appName.frame = CGRect(x: 0, y: frame.width + 2, width: frame.width, height: 40)
        categoryName.frame = CGRect(x: 0, y: frame.width+42, width: frame.width, height: 20)
        priceLabel.frame = CGRect(x: 0, y: frame.width+62, width: frame.width, height: 20)
    }
}

extension UIView {
    func translate () {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
