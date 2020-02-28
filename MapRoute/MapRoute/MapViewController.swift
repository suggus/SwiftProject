//
//  MapViewController.swift
//  MapRoute
//
//  Created by  on 31/01/2020.
//  Copyright © 2020 Gustavo Villa Diez. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var actividadElegida: UILabel!
    
    let locationManager = CLLocationManager()
    var tramoRecorrido = [CLLocation]()
    var texto: String!
    
    
    var distanciaTotal: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
          // Do any additional setup after loading the view.
        actividadElegida.text = texto
        checkLocationServices()
        
    }
      
    func setupLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func centerViewOnUserLocation(){
        if let location = locationManager.location?.coordinate{
            let region = MKCoordinateRegion.init(center: location,latitudinalMeters: 100, longitudinalMeters: 100)
            mapView.setRegion(region, animated: true)
        }
    }
        
    func checkLocationServices(){
        if CLLocationManager.locationServicesEnabled(){
            // setup our location manager
            setupLocationManager()
            checkLocationAuthorization()
        }else{
            //Show allert letting the user kow they have to turn this on
        }
    }
    
    func checkLocationAuthorization(){
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            //Do Map stuff if we have this permissions
            mapView.showsUserLocation = true
            locationManager.startUpdatingLocation()
            centerViewOnUserLocation()
            //locationManager.startUpdatingHeading() ver como implementar el compass
            break
        case .denied:
            //Show alert instructing them how to turn on permissions
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            //Show an alert letting them know wath's up
            break
        case .authorizedAlways:
            //when the maps is in the bakground
            break
        default:
            break
        }
    }
    
    
    /*
    func createPolyline()  {
        let locations = [
            CLLocationCoordinate2D(latitude: 32.77767, longitude: -96.7970),
            CLLocationCoordinate2D(latitude: 37.7833, longitude: -122.4167)
        ]
        //create sample point for Polyline
        let aPolyline = MKPolyline(coordinates: locations, count: locations.count)
        
        //Add Polyline to Map
        mapView.addOverlay(aPolyline)
        
        //Set properties of the line to render
        if (MKOverlay is MKPolyline) {
            let polylineRenderer = MKPolylineRenderer(overlay: <#T##MKOverlay#>)
            polylineRenderer.strokeColor = UIColor.red.withAlphaComponent(0.5)
            polylineRenderer.lineWidth = 5
        }
        
    }*/
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}


extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else{return}
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
        print(location.coordinate.longitude)
        tramoRecorrido.append(location)
        //location.
        if tramoRecorrido.count >= 2 {
            //let longitud = tramoRecorrido[tramoRecorrido.count - 2].longitude
            //let latitud = tramoRecorrido[tramoRecorrido.count - 2].latitude
            
            //let loc2 = CLLocation(latitude: latitud, longitude: longitud)
            let loc2 = tramoRecorrido[tramoRecorrido.count - 2]
            let distancia = location.distance(from: loc2)
            distanciaTotal += distancia
            print(distanciaTotal)
            actividadElegida.text=String(distanciaTotal)
        }
        
    }
        
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    
    }
    
}

