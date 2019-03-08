//
//  Location.swift
//  MapClustersExample
//
//  Created by Alex Stratu on 07/03/2019.
//  Copyright © 2019 Alex Stratu. All rights reserved.
//

import Foundation

struct Coordinate: Decodable {
    var latitude: Double
    var longitude: Double
}

struct Location: Decodable {
    var name: String
    var description: String
    var coordinate: Coordinate
}
