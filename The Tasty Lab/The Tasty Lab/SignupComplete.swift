//
//  SignupComplete.swift
//  The Tasty Lab
//
//  Created by Seung hyun Lee on 10/16/17.
//  Copyright © 2017 The Tasty Lab. All rights reserved.
//

import Foundation
import UIKit

class SignupComplete: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func goHome(_ sender: Any) {
        self.performSegue(withIdentifier: "goHome", sender: self)
    }
    
}
