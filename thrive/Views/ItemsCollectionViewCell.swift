//
//  ItemsCollectionViewCell.swift
//  thrive
//
//  Created by Mitch on 17/10/2019.
//  Copyright © 2019 Mitch. All rights reserved.
//

import UIKit

class ItemsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var scrollableView: UIView!
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var contentLocationLabel: UILabel!
    
    @IBOutlet weak var descriptionHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var contentDistanceLabel: UILabel!
    @IBOutlet weak var contentNameLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()


    }
}
