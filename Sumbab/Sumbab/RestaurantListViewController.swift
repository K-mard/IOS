//
//  RestaurantListViewController.swift
//  Sumbab
//
//  Created by 스마트컨텐츠 on 2025/05/22.
//

import UIKit

class RestaurantListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    var restaurants: [Restaurant] = [
        Restaurant(name: "국밥집", description: "뜨끈한 국밥, 해장에도 딱!", imageName: "국밥", score: "★★★★☆",latitude: 36.993644, longitude: 127.138194,isLiked: false),
        Restaurant(name: "분식집", description: "떡볶이, 튀김, 순대!", imageName: "분식", score: "★★★☆☆",latitude: 36.995341, longitude: 127.135096,isLiked: false),
        Restaurant(name: "1인 라멘", description: "혼자 먹기 좋은 일본 라멘", imageName: "라멘", score: "★★★★★",latitude: 36.994196, longitude: 127.146552,isLiked: false),
        Restaurant(name: "혼자가기 좋은 파스타", description: "조용히 즐기기 좋은 파스타 전문점", imageName: "파스타", score: "★★★☆☆",latitude: 36.996378, longitude: 127.137282,isLiked: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        
        view.backgroundColor = .white
        print("🍽식당 리스트 화면에 진입하였습니다.")
        
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let restaurant = restaurants[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath) as! RestaurantCell
        cell.nameLabel.text = restaurant.name
        cell.thumbnailImageView.image = UIImage(named: restaurant.imageName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedRestaurant = restaurants[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailVC = storyboard.instantiateViewController(withIdentifier: "RestaurantDetailViewController") as? RestaurantDetailViewController {
            detailVC.restaurant = selectedRestaurant
            navigationController?.pushViewController(detailVC, animated: true)
            
        }
        
        
        if let likedVC = storyboard.instantiateViewController(withIdentifier: "LikedRestaurantViewController") as? LikedRestaurantViewController {
            likedVC.allRestaurants = restaurants  // 여기서 전달!
            navigationController?.pushViewController(likedVC, animated: true)
        }
        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
}
