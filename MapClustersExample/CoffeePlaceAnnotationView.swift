//
//  CoffeeAnnotationView.swift
//  MapClustersExample
//
//  Created by Alex Stratu on 07/03/2019.
//  Copyright © 2019 Alex Stratu. All rights reserved.
//

import MapKit

class CoffeePlaceAnnotation: NSObject, MKAnnotation {
    
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(coffeePlace: CoffeePlace) {
        title = coffeePlace.name
        subtitle = coffeePlace.description
        coordinate = CLLocationCoordinate2D(
            latitude: coffeePlace.coordinate.latitude,
            longitude: coffeePlace.coordinate.longitude
        )
    }
    
    init(location: Location) {
        coordinate = CLLocationCoordinate2D(
            latitude: location.latitude,
            longitude: location.longitude
        )
    }
}

class CoffeePlaceAnnotationView: MKMarkerAnnotationView {
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String? = "coffeeAnnotationView") {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        clusteringIdentifier = "coffeeAnnotation"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForDisplay() {
        super.prepareForDisplay()
        displayPriority = .defaultHigh
        markerTintColor = .purple
        glyphImage = UIImage(named: "coffee")
    }
}
