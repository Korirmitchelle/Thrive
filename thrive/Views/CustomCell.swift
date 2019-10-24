//
//  CustomCell.swift
//  thrive
//
//  Created by Mitch on 21/10/2019.
//  Copyright © 2019 Mitch. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var contentNameLabel: UILabel!
    @IBOutlet weak var contentLocationLabel: UILabel!
    @IBOutlet weak var contentDistanceLabel: UILabel!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var contentShareLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
