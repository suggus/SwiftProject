//
//  MiCelda TableViewCell.swift
//  MapRoute
//
//  Created by  on 19/02/2020.
//  Copyright © 2020 Gustavo Villa Diez. All rights reserved.
//

import UIKit

class MiCelda_TableViewCell: UITableViewCell {

    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var RutaButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
