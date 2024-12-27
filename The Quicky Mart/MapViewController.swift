//
//  MapViewController.swift
//  The Quicky Mart
//
//  Created by Shawn Yang on 13/9/24.
//

import UIKit

import MapKit

import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate
{
    @IBOutlet weak var map: MKMapView!
    
    // Singapore Coordinates
    let SG_coordinate = CLLocationCoordinate2D(
        latitude: 1.290270,
        longitude: 103.851959
    )
    
    // SUSS Coordinates
    let SUSS_coordinate = CLLocationCoordinate2D(
        latitude: 1.3291,
        longitude: 103.7762
    )
    
    // SUSS Coordinates
    let Sentosa_coordinate = CLLocationCoordinate2D(
        latitude: 1.2494,
        longitude: 103.8303
    )

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(map)
        
        map.frame = view.bounds
        
        map.setRegion(MKCoordinateRegion(
            center: SG_coordinate,
            span: MKCoordinateSpan(
                latitudeDelta: 0.1,
                longitudeDelta: 0.1)
        ), animated: false)
        
        map.delegate = self
        
        addCustomPin()
        
        // Call the new function to add the SUSS pin
        addSUSSPokeballPin()
        
        // Call the new function to add the Sentosa pin
        addSentosaPokeballPin()
    }
    
    private func addCustomPin() 
    {
        let pin = MKPointAnnotation()
        pin.coordinate = SG_coordinate
        pin.title = "Singapore"
        pin.subtitle = "Pokemon Here in Singapore"
        map.addAnnotation(pin)
    }
    
    // Add a new function to add the SUSS pin
    private func addSUSSPokeballPin() {
        let sussPin = MKPointAnnotation()
        sussPin.coordinate = SUSS_coordinate
        sussPin.title = "SUSS"
        sussPin.subtitle = "Catch 'em all at SUSS!"
        map.addAnnotation(sussPin)
    }
    
    // Add a new function to add the SUSS pin
    private func addSentosaPokeballPin() {
        let sentosaPin = MKPointAnnotation()
        sentosaPin.coordinate = Sentosa_coordinate
        sentosaPin.title = "Sentosa"
        sentosaPin.subtitle = "Catch 'em all at Sentosa!"
        map.addAnnotation(sentosaPin)
    }

    // Map
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? 
    {
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        
        var annotationView = map.dequeueReusableAnnotationView(withIdentifier: "custom")
        
        if annotationView == nil {
            // Create the view
            annotationView = MKAnnotationView(
                annotation: annotation,
                reuseIdentifier: "custom"
            )
            
            annotationView?.canShowCallout = true
            
        }
        else {
            annotationView?.annotation = annotation
        }
        
        annotationView?.image = UIImage(named: "Pokeball_4")
        
        return annotationView
    }
}
