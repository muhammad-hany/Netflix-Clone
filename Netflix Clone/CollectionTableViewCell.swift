//
//  CollectionTableViewCell.swift
//  Netflix Clone
//
//  Created by Muhammad on 11/8/2022.
//

import UIKit

class CollectionTableViewCell: UITableViewCell {

    @IBOutlet weak var featuredCollectionView: UICollectionView!
 
    override func layoutSubviews() {
        featuredCollectionView.delegate=self
        featuredCollectionView.dataSource=self
    }

}

extension CollectionTableViewCell : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = featuredCollectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? CollectionItemCell else { return UICollectionViewCell() }
        cell.cellNumberText.text = String(indexPath.row)
        return cell
    }
}
