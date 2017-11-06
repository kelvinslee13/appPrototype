//
//  FilterViewController.swift
//  The Tasty Lab
//
//  Created by Seung hyun Lee on 11/6/17.
//  Copyright © 2017 The Tasty Lab. All rights reserved.
//

import Foundation
import UIKit

class FilterViewController: UIViewController{
    @IBAction func close_button(_ sender: Any) {
        view.removeFromSuperview()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
