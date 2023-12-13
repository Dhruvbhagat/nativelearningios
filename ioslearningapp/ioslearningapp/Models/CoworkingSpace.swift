//
//  CoworkingSpace.swift
//  ioslearningapp
//
//  Created by Dhruv on 13/12/2023.
//

import Foundation

struct CoworkingSpace: Codable {
    let organisation, address: String
    let website: String
    let latitude, longitude: Double
    let geopoint: Geopoint
}

struct Geopoint: Codable {
    let lon, lat: Double
}
