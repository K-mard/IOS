//
//  LikedRestaurantViewController.swift
//  Sumbab
//
//  Created by 스마트컨텐츠 on 2025/06/05.
//

import UIKit

class LikedRestaurantViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var allRestaurants: [Restaurant] = []
    
    var likedRestaurants: [Restaurant] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        likedRestaurants = allRestaurants.filter { $0.isLiked }
        tableView.dataSource = self
        tableView.delegate = self
        print("전체 식당 수: \(allRestaurants.count)")
        print("좋아요한 식당 수: \(likedRestaurants.count)")

        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return likedRestaurants.count
       }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath) as? RestaurantCell else {return UITableViewCell()}
           let restaurant = likedRestaurants[indexPath.row]
           cell.nameLabel?.text = restaurant.name
           cell.thumbnailImageView.image = UIImage(named: restaurant.imageName)
           return cell
       }


    

}
