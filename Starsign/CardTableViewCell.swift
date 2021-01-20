//
//  CardTableViewCell.swift
//  Starsign
//
//  Created by Guylian Bollon on 08/11/2020.
//

import UIKit

class CardTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func update(with card:Card){
        textLabel?.text = card.title
        detailTextLabel?.text = String(describing:self)
    }
    
}
