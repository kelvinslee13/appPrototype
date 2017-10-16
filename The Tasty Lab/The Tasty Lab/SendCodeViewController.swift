//
//  SendCodeViewController.swift
//  The Tasty Lab
//
//  Created by Seung hyun Lee on 9/21/17.
//  Copyright © 2017 The Tasty Lab. All rights reserved.
//

import UIKit
import FirebaseAuth

class SendCodeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableTwo: UITableView!
    @IBOutlet weak var tableOne: UITableView!
    @IBOutlet weak var dayDropdown: UIPickerView!
    @IBOutlet weak var monthDropdown: UIPickerView!
    @IBOutlet weak var yearDropdown: UIPickerView!

    @IBOutlet weak var dayField: UITextField!
    @IBOutlet weak var monthField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var phoneNum: UITextField!
    
    var year = Array(1910...2002)
    var month = Array(1...12)
    var day = Array(1...31)
    
    let agreeOne = ["할인쿠폰, 특가 상품, 이벤트 소식 동의", "이메일", "SMS", "마케팅을 위한 생년월일 이용에 동의"]
    let agreeTwo = ["전체동의", "이용약관에 동의합니다", "개인정보 수집 및 이용에 동의합니다"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.backgroundColor = UIColor.white
        self.view.backgroundColor = UIColor(red: 248/255, green: 250/255, blue:247/255, alpha:1)
        yearDropdown.isHidden = true
        monthDropdown.isHidden = true
        dayDropdown.isHidden = true
        self.yearDropdown.selectRow(84, inComponent: 0, animated: false)
        

        // Do any additional setup after loading the view.
    }

    @IBAction func sendCode(_ sender: Any) {
        let alert = UIAlertController(title: "Phone Number", message: "Is this your phone number? \n \(phoneNum.text!)", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Yes", style: .default) { (UIAlertAction) in
            PhoneAuthProvider.provider().verifyPhoneNumber("+8210"+self.phoneNum.text!) {(verificationID, error) in
                if error != nil {
                    print("error: \(String(describing: error?.localizedDescription))")
                }else{
                    let defaults = UserDefaults.standard
                    defaults.set(verificationID, forKey: "authVID")
                    self.performSegue(withIdentifier: "code", sender: Any?.self)
                }
                
            }
        }
        
        let cancel = UIAlertAction(title: "No", style: .cancel, handler: nil)
        alert.addAction(action)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var countrows = 0
        if pickerView == yearDropdown{
            countrows = self.year.count
        }
        else if pickerView == monthDropdown{
            countrows = self.month.count
        }
        else if pickerView == dayDropdown{
            countrows = self.day.count
        }
        
        return countrows
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        var Stringyear = year.map{
            String($0)
        }
        var Stringmonth = month.map{
            String($0)
        }
        var Stringday = day.map{
            String($0)
        }
        if pickerView == yearDropdown{
            let titleRow = Stringyear[row]
            return titleRow
        }
        else if pickerView == monthDropdown{
            let titleRow = Stringmonth[row]
            return titleRow
            
        }
        
        else if pickerView == dayDropdown{
            let titleRow = Stringday[row]
            return titleRow
        }
        
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        var stringYear = year.map{
            String($0)
        }
        var stringMonth = month.map{
            String($0)
        }
        var stringDay = day.map{
            String($0)
        }
        if pickerView == yearDropdown{
            self.yearField.text = stringYear[row]
            self.yearDropdown.isHidden = true
        }
        else if pickerView == monthDropdown{
            self.monthField.text = stringMonth[row]
            self.monthDropdown.isHidden = true
        }
        else if pickerView == dayDropdown{
            self.dayField.text = stringDay[row]
            self.dayDropdown.isHidden = true
        }
    }
   
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.yearField{
            self.yearDropdown.isHidden = false
        }
        else if textField == self.monthField{
            self.monthDropdown.isHidden = false
        }
        else if textField == self.dayField{
            self.dayDropdown.isHidden = false
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var count:Int?
        if(tableView == tableOne){
            count = agreeOne.count
        }
        if(tableView == tableTwo){
            count = agreeTwo.count
        }
        return count!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell?
        if(tableView == tableOne){
            cell = tableView.dequeueReusableCell(withIdentifier: "cellOne", for: indexPath)
            cell!.textLabel!.text = agreeOne[indexPath.row]
        }
        else if tableView == tableTwo{
            cell = tableView.dequeueReusableCell(withIdentifier: "cellTwo", for: indexPath)
            cell!.textLabel!.text = agreeTwo[indexPath.row]
        }
        
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
        }
    }

}
