//
//  PostViewCell.swift
//  ExemploTableView
//
//  Created by Pedro Henrique on 28/03/2018.
//  Copyright © 2018 IESB. All rights reserved.
//

import UIKit

class PostViewCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView! {
        didSet {
            cardView.layer.cornerRadius = 4
            cardView.layer.shadowColor = UIColor.black.cgColor
            cardView.layer.shadowOffset = CGSize(width: 4, height: 4)
            cardView.layer.shadowOpacity = 0.33
            
        }
    }
    
    @IBOutlet weak var conteudoLabel: UILabel!
    @IBOutlet weak var tituloLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configurar(comPost post:CodablePost){
        conteudoLabel.text = post.body
        tituloLabel.text = post.title
    }
}
