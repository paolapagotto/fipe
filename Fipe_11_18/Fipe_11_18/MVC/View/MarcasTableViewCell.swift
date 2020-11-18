//
//  MarcasTableViewCell.swift
//  Fipe_11_18
//
//  Created by Grazi Berti on 18/11/20.
//

import UIKit

class MarcasTableViewCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    
    func setup(carro: String) {
        labelName.text = carro
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
