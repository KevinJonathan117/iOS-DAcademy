//
//  MoreController.swift
//  DAcademy
//
//  Created by Kevin Jonathan on 29/04/21.
//

import UIKit

class MoreController: UIViewController {

    @IBOutlet weak var moreTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

extension MoreController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            performSegue(withIdentifier: "toProfile", sender: self)
        }
        if indexPath.section == 2 {
            currentLogin.removeKeyForLogin(key: "username")
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "loginScreen") as! LoginController
            newViewController.modalPresentationStyle = .fullScreen
            self.present(newViewController, animated: true, completion: nil)
        }
    }
}

extension MoreController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {       return ""
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath)
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath)
            
            cell.textLabel?.text = "Kevin Jonathan"
            cell.textLabel?.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.semibold)
            cell.detailTextLabel?.text = "Tech / IT / IS"
            cell.detailTextLabel?.textColor = UIColor.systemGray
            
            
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "academyGameCell", for: indexPath)
            
            cell.textLabel?.text = "Academy Game"
            
            return cell
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "logOutCell", for: indexPath)
            
            cell.textLabel?.text = "Log Out"
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.textColor = UIColor.systemRed
            
            return cell
        }
        return cell
    }
}
