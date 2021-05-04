//
//  ProfileController.swift
//  DAcademy
//
//  Created by Kevin Jonathan on 04/05/21.
//

import UIKit

class ProfileController: UIViewController {
    
    let informationMenu = ["Interests", "Skills"]
    let contactMenu = ["Phone Number", "LinkedIn", "Instagram", "Email"]

    @IBOutlet weak var profileTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

extension ProfileController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("Hello world!")
    }
}

extension ProfileController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Name"
        } else if section == 1 {
            return "Expertise"
        } else if section == 2 {
            return "Personal Information"
        } else if section == 3 {
            return "Contactable At"
        }
        return ""
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 && section == 1 {
            return 1
        } else if section == 2 {
            return 2
        } else if section == 3 {
            return 4
        }
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath)
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath)
            
            cell.textLabel?.text = "Kevin Jonathan"
            
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "expertiseCell", for: indexPath)
            
            cell.textLabel?.text = "Tech / IT / IS"
            
            return cell
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "informationCell", for: indexPath)
            
            cell.textLabel?.text = informationMenu[indexPath.row]
            
            return cell
        } else if indexPath.section == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
            
            cell.textLabel?.text = contactMenu[indexPath.row]
            
            return cell
        }
        return cell
    }
}
