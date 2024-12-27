//
//  MovieCollectionViewCell.swift
//  The Quicky Mart
//
//  Created by Shawn Yang on 12/9/24.
//

import UIKit

class ClothingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var clothingImageView: UIImageView!
    
    @IBOutlet weak var clothingTitleLabel: UILabel!
    
    @IBOutlet weak var clothingPriceLabel: UILabel!
    
    func setup(with clothing: Clothing) {
        clothingImageView.image = clothing.image
        
        clothingTitleLabel.text = clothing.title
        
        clothingPriceLabel.text = clothing.price
    }
    
}
