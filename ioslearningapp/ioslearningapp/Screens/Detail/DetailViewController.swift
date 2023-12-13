//
//  DetailViewController.swift
//  ioslearningapp
//
//  Created by Dhruv on 13/12/2023.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    var coworkingSpace: CoworkingSpace?

    @IBOutlet private weak var orgLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var websiteLabel: UILabel!
    @IBOutlet private weak var latLabel: UILabel!
    @IBOutlet private weak var lngLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    private func configureUI() {
        if let coworkingSpace = coworkingSpace {
            orgLabel.text = "Organisation: \(coworkingSpace.organisation)"
            addressLabel.text = "Address: \(coworkingSpace.address)"
            websiteLabel.text = "Website: \(coworkingSpace.website)"
            latLabel.text = "Latitude: \(coworkingSpace.latitude)"
            lngLabel.text = "Longitude: \(coworkingSpace.longitude)"
            
            title = "Details"
        }
    }
}
