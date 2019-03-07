//
//  ViewController.swift
//  MapClustersExample
//
//  Created by Alex Stratu on 07/03/2019.
//  Copyright © 2019 Alex Stratu. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension ViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        return CoffeePlaceAnnotationView(annotation: annotation)
    }
}

extension ViewController {
    
    func setup() {
        mapView.delegate = self
        mapView.register(CoffeePlaceAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        showCoffeePlaces()
    }
    
    func showCoffeePlaces() {
        let places = Bundle.main.decode([CoffeePlace].self, from: "locations.json")
        for place in places {
            mapView.addAnnotation(
                CoffeePlaceAnnotation(coffeePlace: place)
            )
        }
        mapView.showAnnotations(mapView.annotations, animated: false)
    }
}

