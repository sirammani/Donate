//
//  SignupViewController.swift
//  CoustomLogin
//
//  Created by SRIRAM HKR on 4/22/20.
//  Copyright © 2020 SRIRAM HKR. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class SignupViewController: UIViewController {

    
    
    @IBOutlet weak var FirstnameTextField: UITextField!
    
    
    @IBOutlet weak var LastnameTextField: UITextField!
    
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    
    @IBOutlet weak var signupButton: UIButton!
    
    @IBOutlet weak var ErrorLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements () {
        
        // hide the error leabel
        ErrorLabel.alpha = 0
        
        
        // style the elements
        Utilities.styleTextField(FirstnameTextField)
        
        Utilities.styleTextField(LastnameTextField)
        
        Utilities.styleTextField(EmailTextField)
        
        Utilities.styleTextField(PasswordTextField)
        
        Utilities.styleFilledButton(signupButton)
        
        
        
        
        
        }
    
    
    
//check every data is correct
    
    func validateFields() -> String? {
        
        if FirstnameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            LastnameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            EmailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            PasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all the fields"
        }
        let cleanPassword = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanPassword) == false {
            
            return "Plese enter a secure password with number and a special char total 8 char"
        }
        
        return nil
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func signupButton(_ sender: Any) {
        // validate the fields
        let error = validateFields()
        
        if error != nil {
            
            showError(error!)
        }
        //create user
        else {
            
            let firstName = FirstnameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastname = LastnameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = EmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            
            Auth.auth().createUser(withEmail: email, password: password) { (results, err) in
                
                if  err != nil {
                    
                    self.showError("Error creating user")
                }
            
                else  {
            
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["firstname":firstName, "lastname":lastname, "uid": results!.user.uid]) { (error) in
                        
                        if error != nil {
                            
                            self.showError("error in user data ")
                        }
                        
                    }
                    self.transitionToHome()
            }
                
            
            
        }
        
        
    
    
    }
        }
    
    
    func showError(_ message:String)  {
        ErrorLabel.text = message
        ErrorLabel.alpha = 1
    }
    
    
    func transitionToHome() {
        
        
        let
        homeViewController = storyboard?.instantiateViewController(identifier: Constant.Storyboard.homeViewController) as? HomleViewController
        
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
    }
    
    }
    
    

