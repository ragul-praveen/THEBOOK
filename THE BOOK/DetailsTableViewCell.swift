//
//  DetailsTableViewCell.swift
//  THE BOOK
//
//  Created by Srikanth Vemana on 28/10/21.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var isslabel: UILabel!
    @IBOutlet weak var shadowview: UIView!
    
    @IBOutlet weak var shadow2view: UIView!
    @IBOutlet weak var editbtn: UIButton!
    @IBOutlet weak var finedetail: UILabel!
    @IBOutlet weak var returnonlabel: UILabel!
    @IBOutlet weak var issuenolabel: UILabel!
    @IBOutlet weak var finelabel: UILabel!
    @IBOutlet weak var idlabel: UILabel!
    @IBOutlet weak var authorlabel: UILabel!
    @IBOutlet weak var namelabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
