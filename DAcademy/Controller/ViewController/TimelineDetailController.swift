//
//  TimelineDetailController.swift
//  DAcademy
//
//  Created by Kevin Jonathan on 05/05/21.
//

import UIKit

class TimelineDetailController: UIViewController {

    @IBOutlet weak var timelineDetailImage: UIImageView!
    @IBOutlet weak var timelineDetailName: UILabel!
    @IBOutlet weak var timelineDetailDate: UILabel!
    @IBOutlet weak var timelineDetailContent: UILabel!
    
    var name = ""
    var date = ""
    var content = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timelineDetailImage.layer.cornerRadius = 25
        timelineDetailName.text = name
        timelineDetailDate.text = date
        timelineDetailContent.text = content
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
