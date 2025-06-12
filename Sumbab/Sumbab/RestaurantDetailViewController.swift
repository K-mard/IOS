//
//  RestaurantDetailViewController.swift
//  Sumbab
//
//  Created by 스마트컨텐츠 on 2025/05/29.
//

import UIKit
import CoreLocation

class RestaurantDetailViewController: UIViewController//,CLLocationManagerDelegate
{
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //@IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    var isLiked = false
    
    var restaurant: Restaurant?
    
    var restaurantKey: String {
        return "liked_\(restaurant?.name ?? "")"
    }
    
    //let locationManager = CLLocationManager()
    //var currentLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
           // if let location = locations.last {
              //  currentLocation = location
                //updateDistanceToRestaurant()
                //locationManager.stopUpdatingLocation()  // 위치 계속 갱신 방지
            //}
        //}
        
        //func updateDistanceToRestaurant() {
            //guard let current = currentLocation else { return }
            //let restaurantLocation = CLLocation(latitude: restaurant.latitude, longitude: restaurant.longitude)

            //let distanceInMeters = current.distance(from: restaurantLocation)
            //let distanceInKilometers = distanceInMeters / 1000.0

            //distanceLabel.text = String(format: "현재 위치로부터 %.2fkm", distanceInKilometers)
        //}
        
        
        
        
        // 위치 권한 요청 및 시작
            //locationManager.delegate = self
            //locationManager.requestWhenInUseAuthorization()
            //locationManager.startUpdatingLocation()
        
        guard let restaurant = restaurant else { return }
        
        nameLabel.text = restaurant.name
        descriptionLabel.text = restaurant.description
        scoreLabel.text = "혼밥 점수: \(restaurant.score)"
        imageView.image = UIImage(named: restaurant.imageName)
        
        isLiked = UserDefaults.standard.bool(forKey: restaurantKey)
                updateLikeButton()
        
        
    }
    @IBAction func didTapShowMapButton(_ sender: UIButton) {
        print("위치 보기 버튼 눌림!")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // 2. MapViewController 인스턴스 생성
        if let mapVC = storyboard.instantiateViewController(withIdentifier: "MapViewController") as? MapViewController {
            guard let restaurant = self.restaurant else { return }
            // 3. 데이터 전달 (식당 이름)
            mapVC.restaurant = self.restaurant// 예시: 식당 이름 레이블에서 텍스트 전달
            
            mapVC.destinationCoordinate = CLLocationCoordinate2D(
                    latitude: restaurant.latitude,
                    longitude: restaurant.longitude
                ) // ✅ 이걸 추가
            
            // 4. 화면 이동 (navigationController 이용)
            self.navigationController?.pushViewController(mapVC, animated: true)
        }
    }
    
    @IBAction func didTapLikeButton(_ sender: UIButton) {
        isLiked.toggle()
        updateLikeButton()
        restaurant?.isLiked = true
        
        UserDefaults.standard.set(isLiked, forKey: restaurantKey)
    }
    func updateLikeButton() {
        let imageName = isLiked ? "heart.fill" : "heart"
        likeButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
}
