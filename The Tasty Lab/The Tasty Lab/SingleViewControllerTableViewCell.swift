//
//  SingleViewControllerTableViewCell.swift
//  The Tasty Lab
//
//  Created by Seung hyun Lee on 9/19/17.
//  Copyright © 2017 The Tasty Lab. All rights reserved.
//

import UIKit

class SingleViewControllerTableViewCell: UITableViewCell {

    @IBOutlet weak var foodImage: UIImageView!
    
    @IBOutlet weak var foodName: UILabel!
    
    @IBOutlet weak var foodPrice: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
