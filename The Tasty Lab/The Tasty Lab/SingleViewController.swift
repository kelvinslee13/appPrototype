//
//  SingleViewController.swift
//  The Tasty Lab
//
//  Created by Seung hyun Lee on 9/18/17.
//  Copyright © 2017 The Tasty Lab. All rights reserved.
//

import UIKit

class SingleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
