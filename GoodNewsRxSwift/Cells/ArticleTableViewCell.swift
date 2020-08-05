//
//  ArticleTableViewCell.swift
//  GoodNewsRxSwift
//
//  Created by mohamed  habib on 05/08/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import UIKit
import Foundation

class ArticleTableViewCell: UITableViewCell {

      @IBOutlet weak var titleLabel: UILabel?
      @IBOutlet weak var descriptionLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
