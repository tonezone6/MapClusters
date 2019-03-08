//
//  CoffeeAnnotationView.swift
//  MapClustersExample
//
//  Created by Alex Stratu on 07/03/2019.
//  Copyright © 2019 Alex Stratu. All rights reserved.
//

import MapKit

class Coffee: MKPointAnnotation {
    
//    enum CoffeeType {
//        case origin, regular
//    }
//    var type: CoffeeType
    
    convenience init(location: Location) {
        self.init()
        self.title = location.name
        self.subtitle = location.description
        // self.type = coffee.type
        self.coordinate = CLLocationCoordinate2D(
            latitude: location.coordinate.latitude,
            longitude: location.coordinate.longitude
        )
    }
}

class CoffeeView: MKMarkerAnnotationView {
    
    override var annotation: MKAnnotation? {
        willSet {
            guard newValue is Coffee else { return }
            markerTintColor = .purple
            glyphImage = UIImage(named: "coffee")
            clusteringIdentifier = "coffee"
            displayPriority = .defaultHigh
            // canShowCallout = true
            // rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
    }
}

class CoffeeClusterView: MKMarkerAnnotationView {
    
    override var annotation: MKAnnotation? {
        willSet {
            guard newValue is MKClusterAnnotation else { return }
            markerTintColor = .purple
        }
    }
}
