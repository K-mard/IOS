//
//  MapViewController.swift
//  Sumbab
//
//  Created by 스마트컨텐츠 on 2025/06/05.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController,MKMapViewDelegate, CLLocationManagerDelegate  {

    @IBOutlet weak var mapView: MKMapView!
    var restaurantName: String?
    var restaurant: Restaurant?
    
    var locationManager = CLLocationManager()
    var destinationCoordinate: CLLocationCoordinate2D?  // 식당 위치
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        setupMap()
    }
    
    func setupMap() {
            guard let restaurant = restaurant else { return }

            // 핀 설정
            let annotation = MKPointAnnotation()
            annotation.title = restaurant.name
            annotation.coordinate = CLLocationCoordinate2D(latitude: restaurant.latitude, longitude: restaurant.longitude)
            mapView.addAnnotation(annotation)

            // 지도 위치 설정
            let region = MKCoordinateRegion(center: annotation.coordinate,
                                            latitudinalMeters: 1000,
                                            longitudinalMeters: 1000)
            mapView.setRegion(region, animated: true)
        }

    
    
    
    
    
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            if let userLocation = locations.last?.coordinate,
               let destination = destinationCoordinate {
                drawRoute(from: userLocation, to: destination)
                locationManager.stopUpdatingLocation()
            }
        }
        
        
        func drawRoute(from source: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D) {
            let sourcePlacemark = MKPlacemark(coordinate: source)
            let destinationPlacemark = MKPlacemark(coordinate: destination)

            let directionRequest = MKDirections.Request()
            directionRequest.source = MKMapItem(placemark: sourcePlacemark)
            directionRequest.destination = MKMapItem(placemark: destinationPlacemark)
            directionRequest.transportType = .automobile  // or .walking

            let directions = MKDirections(request: directionRequest)
            directions.calculate { (response, error) in
                guard let route = response?.routes.first else { return }
                self.mapView.addOverlay(route.polyline)
                self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
            }
        }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let polyline = overlay as? MKPolyline {
                let renderer = MKPolylineRenderer(overlay: polyline)
                renderer.strokeColor = .red
                renderer.lineWidth = 4
                return renderer
            }
            return MKOverlayRenderer(overlay: overlay)
        }
        
        
        //setupMap()

        // Do any additional setup after loading the view.
    }
    
    
    
        
    
        
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


