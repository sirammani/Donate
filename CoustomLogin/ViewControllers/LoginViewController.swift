//
//  LoginViewController.swift
//  CoustomLogin
//
//  Created by SRIRAM HKR on 4/22/20.
//  Copyright © 2020 SRIRAM HKR. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var EmailTextField: UITextField!
    
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var LoginButton: UIButton!
    
    
    @IBOutlet weak var LoginErrorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()

        // Do any additional setup after loading the view.
    }
    
    func setUpElements()  {
        
        // hide the error leabel
        LoginErrorLabel.alpha = 0
        
        // Style
        
        Utilities.styleTextField(EmailTextField)
        
        Utilities.styleTextField(PasswordTextField)
        
        Utilities.styleFilledButton(LoginButton)
    }

    


    @IBAction func LoginButton(_ sender: Any) {
        
        let email = EmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        
        Auth.auth().signIn(withEmail: email, password: password) {
            (result, error) in
            
            if error != nil {
                
                self.LoginErrorLabel.text = error!.localizedDescription
                self.LoginErrorLabel.alpha = 1
                
                
            }
            else {
                let
                homeViewController = self.storyboard?.instantiateViewController(identifier: Constant.Storyboard.homeViewController) as? HomleViewController
                
                
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
                
                
            }
        }
        
        
    }
    

}
