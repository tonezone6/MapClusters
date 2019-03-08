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
        
        mapView.register(CoffeeView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        mapView.register(CoffeeClusterView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier)
        showCoffee()
    }
    
    func showCoffee() {
        Bundle.main.decode([Location].self, from: "locations.json").forEach {
            mapView.addAnnotation(Coffee(location: $0))
        }
        mapView.showAnnotations(mapView.annotations, animated: false)
    }
}
