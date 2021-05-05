//
//  TimelineController.swift
//  DAcademy
//
//  Created by Kevin Jonathan on 29/04/21.
//

import UIKit

class TimelineController: UIViewController {
    @IBOutlet weak var timelineCollectionView: UICollectionView!
    
    var timelineData = [Timeline]()
    
    var tempName = ""
    var tempDate = ""
    var tempContent = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timelineData.append(Timeline(name: "Kevin Jonathan",
                                     date: "17:30 PM - 6 April 2021",
                                     content: "Today, I have learnt about how to use AVFoundation framework. It is very interesting because I can play and record my voice using the AVRecorder and AVPlayer, cool! I learnt about this framework using Stackoverflow and Apple’s Documentation. With AVRecorder, we can just use .start(), .pause(), stop() to manage the recording session. It is not that hard whatsoever to implement this in our projects."))
        timelineData.append(Timeline(name: "Kevin Jonathan",
                                     date: "19:30 PM - 21 Maret 2021",
                                     content: "Today, I have learnt about how to use UIKit framework. I struggled at first but I started to get the hang of it! I guess? But anyway, I want to share my experience in this timeline that Swift is relatively easy!"))
        // Do any additional setup after loading the view.
    }
    @IBAction func addNewTimeline(_ sender: Any) {
        performSegue(withIdentifier: "toNewTimeline", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? TimelineDetailController {
            vc.name = tempName
            vc.date = tempDate
            vc.content = tempContent
        }
    }
    
    @objc func timelineDetailOnClick(sender: UIButton!) {
        tempName = timelineData[sender.tag].name
        tempDate = timelineData[sender.tag].date
        tempContent = timelineData[sender.tag].content
        performSegue(withIdentifier: "toTimelineDetail", sender: self)
    }
    
    @objc func timelineOptionOnClick(sender: UIButton!) {
        let myActionSheet =  UIAlertController(title: "Timeline Option", message: "Button for timeline option", preferredStyle: UIAlertController.Style.actionSheet)
        myActionSheet.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        myActionSheet.addAction(UIAlertAction(title: "Delete", style: UIAlertAction.Style.destructive, handler: { (ACTION :UIAlertAction!) in
            self.timelineData.remove(at: sender.tag)
            self.timelineCollectionView.reloadData()
        }))
        self.present(myActionSheet, animated: true, completion: nil)
    }
}

extension TimelineController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension TimelineController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return timelineData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = timelineCollectionView.dequeueReusableCell(withReuseIdentifier: "timelineCell", for: indexPath) as! TimelineCollectionViewCell
        
        cell.timelineName.text = timelineData[indexPath.item].name
        cell.timelineDate.text = timelineData[indexPath.item].date
        cell.timelineContent.text = timelineData[indexPath.item].content
        cell.timelineImage.layer.cornerRadius = 25
        cell.timelineDetailButton.addTarget(self, action: #selector(timelineDetailOnClick), for: .touchUpInside)
        cell.timelineDetailButton.tag = indexPath.item
        cell.timelineButton.addTarget(self, action: #selector(timelineOptionOnClick), for: .touchUpInside)
        cell.timelineButton.tag = indexPath.item
        
        return cell
    }
}
