//
//  RestaurantCell.swift
//  Sumbab
//
//  Created by 스마트컨텐츠 on 2025/06/05.
//

import UIKit

class RestaurantCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
