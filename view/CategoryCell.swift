//
//  CategoryCell.swift
//  AppStore
//
//  Created by sangita singh on 11/3/17.
//  Copyright © 2017 hulu. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let appCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let appCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        appCollectionView.translatesAutoresizingMaskIntoConstraints=false
        return appCollectionView
    }()
    
    let separatorView : UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        separatorView.translate()
        return separatorView
    }()
    
    let titleLabel : UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.black
        titleLabel.text = "Best Games"
        titleLabel.translate()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        return titleLabel
    }()
    
    func setUpViews()  {
        appCollectionView.delegate = self
        appCollectionView.dataSource = self
        appCollectionView.backgroundColor = UIColor.white
        addSubview(appCollectionView)
        addSubview(separatorView)
        addSubview(titleLabel)
        appCollectionView.register(AppCell.self, forCellWithReuseIdentifier: "cellId")
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":titleLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":separatorView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":appCollectionView]))
    
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v2(20)][v0][v1(1)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v2":titleLabel,"v0":appCollectionView,"v1":separatorView]))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! AppCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: frame.height-30)
    }
    
    
    
}
