//
//  CameraTableViewCell.swift
//  CameraSpec
//
//  Created by metalbee on 6/21/20.
//  Copyright © 2020 sanengineer. All rights reserved.
//

import UIKit

class CameraTableViewCell: UITableViewCell {
    
    @IBOutlet weak var photoCamera: UIImageView!
    @IBOutlet weak var nameCamera: UILabel!
    @IBOutlet weak var descCamera: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
