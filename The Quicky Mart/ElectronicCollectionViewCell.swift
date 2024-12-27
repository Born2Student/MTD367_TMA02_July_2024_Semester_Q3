//
//  ElectronicCollectionViewCell.swift
//  The Quicky Mart
//
//  Created by Shawn Yang on 12/9/24.
//

import UIKit

class ElectronicCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var electronicImageView: UIImageView!
    
    @IBOutlet weak var electronicTitleLabel: UILabel!
    
    @IBOutlet weak var electronicPriceLabel: UILabel!
    
    func setup(with electronic: Electronic) {
        
        electronicImageView.image = electronic.image
        
        electronicTitleLabel.text = electronic.title
        
        electronicPriceLabel.text = electronic.price
        
    }
}
