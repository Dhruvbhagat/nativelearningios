//
//  CoworkingSpaceViewCell.swift
//  ioslearningapp
//
//  Created by Dhruv on 13/12/2023.
//

import Foundation
import UIKit

class CoworkingSpaceViewCell : UITableViewCell {
    
    @IBOutlet weak var orgLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    func setData(data: CoworkingSpace) {
        selectionStyle = .none
        orgLabel.text = data.organisation
        addressLabel.text = data.address
    }
}
