//
//  CartViewController.swift
//  The Tasty Lab
//
//  Created by Seung hyun Lee on 11/6/17.
//  Copyright © 2017 The Tasty Lab. All rights reserved.
//

import Foundation
import UIKit

class CartViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{
    
    let foodImages = ["food_one","food_two","food_three","food_four"]
    let foodNames = ["Korean food 1", "Korean food 2", "Korean food 3", "Korean food 4"]
    let foodPrice = ["5,000원", "6,500원", "7,000원","5,500원"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SingleViewControllerTableViewCell
        
        cell.foodImage.image = UIImage(named: foodImages[indexPath.row])
        cell.foodName.text = foodNames[indexPath.row]
        cell.foodPrice.text = foodPrice[indexPath.row]
        
        return cell
        
    }
    @IBOutlet weak var totalPrice: UILabel!
    
    @IBAction func order_button(_ sender: Any) {
        performSegue(withIdentifier: "paySegue", sender: self)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalPrice.text = "총 합계 금액은 : 6,000원입니다."
        totalPrice.textAlignment = .center
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
