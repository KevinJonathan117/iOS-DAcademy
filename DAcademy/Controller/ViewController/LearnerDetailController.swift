//
//  LearnerDetailController.swift
//  DAcademy
//
//  Created by Kevin Jonathan on 03/05/21.
//

import UIKit

class LearnerDetailController: UIViewController {

    @IBOutlet weak var learnerImage: UIImageView!
    @IBOutlet weak var learnerName: UILabel!
    @IBOutlet weak var learnerExpertise: UILabel!
    @IBOutlet weak var learnerShift: UILabel!
    @IBOutlet weak var learnerTeam: UILabel!
    
    var name : String = ""
    var photo : String = ""
    var expertise : String = ""
    var team : String = ""
    var shift : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: photo)
        if let data = try? Data(contentsOf: url!) {
            self.learnerImage.image = UIImage(data: data)
        }
        learnerName.text = name
        learnerExpertise.text = "\(expertise)"
        learnerTeam.text = "Team: \(team)"
        learnerShift.text = "Shift: \(shift)"
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
