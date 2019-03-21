//
//  BasicTableViewCell.swift
//  ProductDetailsSectionSample
//
//  Created by Aina Jain on 19/03/19.
//  Copyright © 2019 Aina Jain. All rights reserved.
//

import UIKit

class BasicTableViewCell: UITableViewCell {

    @IBOutlet weak var valueText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
