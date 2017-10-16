//
//  TabBarController.swift
//  The Tasty Lab
//
//  Created by Seung hyun Lee on 9/18/17.
//  Copyright © 2017 The Tasty Lab. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    
    @IBOutlet weak var btnMenuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if revealViewController() != nil {
            btnMenuButton.target = revealViewController()
            btnMenuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        }
        
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
