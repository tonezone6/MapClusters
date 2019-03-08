//
//  CoffeeAnnotationView.swift
//  MapClustersExample
//
//  Created by Alex Stratu on 07/03/2019.
//  Copyright © 2019 Alex Stratu. All rights reserved.
//

import MapKit

class CoffeeAnnotation: MKPointAnnotation {
    
//    enum CoffeeType {
//        case origin, regular
//    }
//    var type: CoffeeType
    
    convenience init(coffee: Coffee) {
        self.init()
        self.title = coffee.name
        self.subtitle = coffee.description
        // self.type = coffee.type
        self.coordinate = CLLocationCoordinate2D(
            latitude: coffee.coordinate.latitude,
            longitude: coffee.coordinate.longitude
        )
    }
}

class CoffeeView: MKMarkerAnnotationView {
    
    override var annotation: MKAnnotation? {
        willSet {
            guard newValue is CoffeeAnnotation else { return }
            clusteringIdentifier = "bike"
            displayPriority = .defaultHigh
            markerTintColor = .purple
            glyphImage = UIImage(named: "coffee")
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
