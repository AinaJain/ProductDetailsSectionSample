//
//  ReviewTableViewCell.swift
//  ProductDetailsSectionSample
//
//  Created by Aina Jain on 19/03/19.
//  Copyright © 2019 Aina Jain. All rights reserved.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var starView: CosmosView!
    @IBOutlet weak var numberOfLikesLabel: UILabel!
    @IBOutlet weak var reviewTimeLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var revierNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
