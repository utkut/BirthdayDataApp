//
//  ViewController.swift
//  BirthdayDataApp
//
//  Created by Utku Tarhan on 12/26/19.
//  Copyright © 2019 Utku Tarhan. All rights reserved.
//
//  The code written was written for personal development / educational purposes on
//  San Francisco State University and does not infringe any conflict of interest
//  with Apple Business Conduct 2019.


import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //User Defaults saved to storedName variable (protected)
        
        let storedName = UserDefaults.standard.object(forKey: "userDefaultName")
        let storedBirthday = UserDefaults.standard.object(forKey: "userDefaultBirthday")
        
        //Casting as? vs as!
        
        
        nameLabel.text = storedName as? String
        birthdayLabel.text = storedBirthday as? String
        
        // Do any additional setup after loading the view.
    }


    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameInput:UITextField!
    
    @IBOutlet weak var birthdayInput: UITextField!
    @IBOutlet weak var birthdayLabel: UILabel!

    @IBAction func resetClick(_ sender: Any) {
        
        //Resets saved information by recalling it from userdefault and assigning it to a var
        
       let storedName = UserDefaults.standard.object(forKey: "userDefaultName")
       let storedBirthday = UserDefaults.standard.object(forKey:"userDefaultBirthday")
        
        if (storedName as? String) != nil  {
            UserDefaults.standard.removeObject(forKey: "userDefaultName") //Remove Name
            nameLabel.text = "Name: "
            
        }
        if (storedBirthday as? String) != nil { //If this operation can be performed
            UserDefaults.standard.removeObject(forKey: "userDefaultBirthday") // Remove Birthday
            birthdayLabel.text = "Birthdate: "
        }
        
        
        
    }
    
    @IBAction func submitClick(_ sender: Any) {
        
        if let userName = nameInput.text {
            if let birthDate = birthdayInput.text {
                
                UserDefaults.standard.set(nameInput.text, forKey: "userDefaultName")
                UserDefaults.standard.set(birthdayInput.text,forKey: "userDefaultBirthday")
//                UserDefaults.standard.synchronize() The code got is not used anymore
                
                nameLabel.text = "Name: \(String(userName))"
                birthdayLabel.text = "Birthdate: \(String(birthDate))"
                
                // Setting the labels as the User Inputs.
                
                
                
            }
        }
        
    }
    

}

