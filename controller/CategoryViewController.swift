//
//  CategoryViewController.swift
//  AppStore
//
//  Created by sangita singh on 11/3/17.
//  Copyright © 2017 hulu. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CategoryViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    var appCategories : [AppCategory]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.title = "AppStore"
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        AppCategory.fetchAppCategories()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }


    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CategoryCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 230)
    }
}
