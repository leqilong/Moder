//
//  StarredTableViewCell.swift
//  Moder
//
//  Created by Leqi Long on 11/3/16.
//  Copyright © 2016 TeamAwesome. All rights reserved.
//

import UIKit

class StarredTableViewCell: UITableViewCell {

    @IBOutlet weak var starredChartImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
