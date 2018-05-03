//
//  UsersTableViewCell.swift
//  aula07-ConexaoHTTP
//
//  Created by HC2MAC017 on 02/05/2018.
//  Copyright © 2018 IESB. All rights reserved.
//

import UIKit

class UsersTableViewCell: UITableViewCell {

    @IBOutlet weak var nomeUsuario: UILabel!
    @IBOutlet weak var usernameUsuario: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
