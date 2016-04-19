//
//  ViewController.swift
//  Maps Project
//
//  Created by Dan Gonzalez on 2016-04-18.
//  Copyright © 2016 varyag00. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

//NOTE: to work with map, we must add its correponing MKMapViewDelegate to handle controlling the map view
//NOTE: to get use locaiton, use CLLocationManagerDelegate
class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    //MARK: Attributes
    var locationManager = CLLocationManager()
    
    
    //MARK: Outlets
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        
        initMap(mapView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //MARK: Map Functionality
    
    //Note: when I'm writing a real app I'd want to enforce MVC conventions
    
    
    func initMap(map : MKMapView) {
        
        //set delegate to self
        locationManager.delegate = self
        //set desired location accuracy
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //choose whether to request location always or when in use
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        //center point of screen
        let lat:CLLocationDegrees = 51.044270
        let lng:CLLocationDegrees = -114.062019
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, lng)
        
        //screen width, lower = more zoomed in, higher = more zoomed in
        let latDelta:CLLocationDegrees = 0.001
        let lngDelta:CLLocationDegrees = 0.5
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lngDelta)
        
        //use the above info to create map's "extent"
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated: true)
        
        
        
        //adding an annotation
        let annotation = MKPointAnnotation()
        annotation.title = "My marker!"
        annotation.subtitle = "my marker's subtitle"
        annotation.coordinate = location
        map.addAnnotation(annotation)
        
        
        
        //add long press recognizer
        //adding long press
        //note: adding ':' to the end of func name denotes forwarding current object
        let uilpgr = UILongPressGestureRecognizer(target: self, action: "myAction:")
        uilpgr.minimumPressDuration = 2
        mapView.addGestureRecognizer(uilpgr)
    }
    
    
    func myAction(uigr:UIGestureRecognizer) {
        print("gesture recognized")
        
        //get press location, add marker at location
        let tp = uigr.locationInView(self.mapView)
        
        let coor:CLLocationCoordinate2D = mapView.convertPoint(tp, toCoordinateFromView: self.mapView)
        
        //adding an annotation
        let annotation = MKPointAnnotation()
        annotation.title = "My manually added marker!"
        annotation.subtitle = "my manually added marker's subtitle"
        annotation.coordinate = coor
        
        mapView.addAnnotation(annotation)
    }
    
    
    //override method method, called whenever update is updated by phone
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        
        let userLoc:CLLocation = locations[0] as! CLLocation
    
        //center point of screen
        let lat = userLoc.coordinate.latitude
        let lng = userLoc.coordinate.longitude
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, lng)
        
        //screen width, lower = more zoomed in, higher = more zoomed in
        let latDelta:CLLocationDegrees = 0.0001
        let lngDelta:CLLocationDegrees = 0.05
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lngDelta)
        
        //use the above info to create map's "extent"
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        self.mapView.setRegion(region, animated: true)
    }
}

