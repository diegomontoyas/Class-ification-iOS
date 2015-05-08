//
//  MultipleChoiceAnswerTableViewCell.swift
//  Class-ification
//
//  Created by Diego on 5/5/15.
//  Copyright (c) 2015 diegomontoyas. All rights reserved.
//

import UIKit

class MultipleChoiceAnswerTableViewCell: UITableViewCell {

    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var letterLabel: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
