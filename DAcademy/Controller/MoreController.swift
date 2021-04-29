//
//  MoreController.swift
//  DAcademy
//
//  Created by Kevin Jonathan on 29/04/21.
//

import UIKit

class MoreController: UIViewController {
    
    var currentLogin = CurrentLogin()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutOnClick(_ sender: UIButton) {
        currentLogin.removeKeyForLogin(key: "username")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
