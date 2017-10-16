//
//  LoginViewController.swift
//  The Tasty Lab
//
//  Created by Seung hyun Lee on 9/18/17.
//  Copyright © 2017 The Tasty Lab. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import GoogleSignIn

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate, GIDSignInUIDelegate{

    @IBOutlet weak var txtUsername: UITextField!
   
    @IBOutlet weak var txtPassword: UITextField!
    

    
    //login button(with id and pass)
    @IBAction func btnLogin(_ sender: Any) {
        print("login clicked")
        
    }
    
    //create account button
    @IBAction func btnCreateAccount(_ sender: Any) {
        print("create clciked")
        self.performSegue(withIdentifier: "createAccountSegue", sender: Any?.self)
    }
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var menu: UIBarButtonItem!
    let imageNames = ["desktop_img1","desktop_img2", "desktop_img3"]

    override func viewDidLoad() {
        super.viewDidLoad()
        menu.target = revealViewController()
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
        
        //FB login
        let fbLogin = FBSDKLoginButton()
        view.addSubview(fbLogin)
        fbLogin.frame = CGRect(x: view.frame.minX, y: view.frame.maxY-100, width: view.frame.width, height: 50)
        fbLogin.delegate = self
        
        //set background image
        let randInt:Int = Int(arc4random_uniform(3))
        backgroundImage.image = UIImage(named: imageNames[randInt])
        
        //background blur effect
        /*let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.view.bounds
        self.view.insertSubview(blurView, aboveSubview: backgroundImage)
        */
        
        //text fiels layer
        
        
        txtUsername.backgroundColor = UIColor.white
        
        
        
        
        
        txtPassword.backgroundColor = UIColor.white
        
        
        
        //login button change design
        //btnLogin.layer.cornerRadius = 20
        //btnLogin.clipsToBounds = true
        
        
        //add Google sign in
        //let googleButton = GIDSignInButton()
        //googleButton.frame = CGRect(x: view.frame.minX, y: view.frame.maxY-50, width: view.frame.width, height: 50)
        //view.addSubview(googleButton)
        
        
        //custom Google signin
        let customButton = UIButton(type: .system)
        customButton.frame = CGRect(x: view.frame.minX, y: view.frame.maxY-50, width: view.frame.width, height: 50)
        customButton.backgroundColor = .orange
        customButton.setTitle("Custom Google Sign in", for: .normal)
        customButton.addTarget(self, action: #selector(handleCustomGooglesign), for: .touchUpInside)
        customButton.setTitleColor(.white, for: .normal)
        customButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        view.addSubview(customButton)
 
        
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    func handleCustomGooglesign(){
        GIDSignIn.sharedInstance().signIn()
    }
    
    //FB logout sign
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("logged out of facebook")
    }
    
    
    //FB login sign
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil{
            print(error)
            return
        }
         print("Succesfully logged in")
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
