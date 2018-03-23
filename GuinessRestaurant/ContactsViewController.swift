//
//  ContactsViewController.swift
//  MondoRestaurant
//
//  Created by Dan  Tatar on 19/03/2018.
//  Copyright © 2018 Dany. All rights reserved.
//

import UIKit
import MapKit
import AddressBook


class ContactsViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var mapKit: MKMapView!
    
    @IBOutlet weak var textView: UITextView!
 
    var locationManager = CLLocationManager()
   
    let latitude: CLLocationDegrees = 51.514535
    let longitude: CLLocationDegrees = -0.134160

    
    override func viewDidLoad() {
        super.viewDidLoad()
     
     //   let mondoCoordinates = CLLocationCoordinate2DMake(latitude, longitude)
        showMondoOnmap()
        zoomIn()
      
        }
    @IBAction func startRoute(_ sender: UIButton) {
        
        let mondoCoordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let placemark = MKPlacemark(coordinate: mondoCoordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Mondo Restaurant"
        let sourceCoordinates = locationManager.location
        
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestLocation()
        }
        let regionRadius: CLLocationDistance  = 1000

        let regionSpan = MKCoordinateRegionMakeWithDistance(mondoCoordinates, regionRadius, regionRadius)
        
        mapKit.setRegion(regionSpan, animated: true)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        mapItem.openInMaps(launchOptions: options)
    }
    
    
    func showMondoOnmap() {
   
       let mondoCoordinates = CLLocationCoordinate2DMake(latitude, longitude)
       let mondoRestaurant = RestaurantAnnotation(title: "Mondo Restaurant", subtitle: "Wardour St.", coordinate: mondoCoordinates)
        
        mapKit.addAnnotation(mondoRestaurant)
        mapKit.delegate = self
        mapKit.showsScale = true
        mapKit.showsUserLocation = true
        
       
    }
    func zoomIn() {
        let mondoCoordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionRadius: CLLocationDistance  = 10000
        let regionSpan = MKCoordinateRegionMakeWithDistance(mondoCoordinates, regionRadius, regionRadius)
        
        mapKit.setRegion(regionSpan, animated: true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
class RestaurantAnnotation: NSObject, MKAnnotation {
    let title: String?
    let subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
   
}

