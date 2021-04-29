//
//  ViewController.swift
//  DAcademy
//
//  Created by Kevin Jonathan on 29/04/21.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var usernameTextbox: UITextField!
    @IBOutlet weak var passwordTextbox: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 8
        if currentLogin.getStatusForLogin(key: "username") == true {
            self.performSegue(withIdentifier: "toHome", sender: self)
        } 
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector (LoginController.DismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func DismissKeyboard(){
        view.endEditing(true)
    }

    @IBAction func loginOnClick(_ sender: UIButton) {
        if usernameTextbox.text?.lowercased() == "kevin" && passwordTextbox.text?.lowercased() == "123" {
            currentLogin.setValueForLogin(value: "kevin", key: "username")
            self.performSegue(withIdentifier: "toHome", sender: self)
        }
    }
    
}

