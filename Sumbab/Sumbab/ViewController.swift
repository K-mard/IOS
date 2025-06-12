//
//  ViewController.swift
//  Sumbab
//
//  Created by 스마트컨텐츠 on 2025/05/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var welcomeLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapGoButton(_ sender: UIButton) {
        print("버튼 눌림!")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "RestaurantListViewController") as? RestaurantListViewController{
            print("화면 생성 성공")
            print("navigationController: \(String(describing: self.navigationController))")
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            print("VC생성 실패.")
        }
    }
    
}

