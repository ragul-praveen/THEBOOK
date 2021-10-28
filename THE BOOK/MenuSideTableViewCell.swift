//
//  MenuSideTableViewCell.swift
//  DriveIn
//
//  Created by Srikanth Vemana on 30/03/20.
//  Copyright © 2020 Adaptteq. All rights reserved.
//

import UIKit

class MenuSideTableViewCell: UITableViewCell {
    @IBOutlet weak var newimage:UIImageView!
    @IBOutlet weak var lblname: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
