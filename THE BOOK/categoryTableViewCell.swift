//
//  categoryTableViewCell.swift
//  THE BOOK
//
//  Created by Srikanth Vemana on 28/10/21.
//

import UIKit

class categoryTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryname: UILabel!
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var bgview: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.bgview.layer.cornerRadius = 10
       // self.bgview.layer.borderColor = Colors.colorClear.cgColor
        self.bgview.layer.masksToBounds = true
        
        self.bgview.layer.shadowOpacity = 2//0.18
        self.bgview.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.bgview.layer.shadowRadius = 2
        self.bgview.layer.shadowColor = UIColor.darkGray.cgColor
        self.bgview.layer.masksToBounds = false
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
