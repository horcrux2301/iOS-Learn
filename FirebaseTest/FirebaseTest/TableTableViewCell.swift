//
//  TableTableViewCell.swift
//  FirebaseTest
//
//  Created by Harsh Khajuria on 20/04/19.
//  Copyright © 2019 horcrux2301. All rights reserved.
//

import UIKit

class TableTableViewCell: UITableViewCell {

    @IBOutlet weak var photo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
