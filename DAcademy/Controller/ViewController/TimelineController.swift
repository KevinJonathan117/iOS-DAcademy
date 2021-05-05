//
//  TimelineController.swift
//  DAcademy
//
//  Created by Kevin Jonathan on 29/04/21.
//

import UIKit

class TimelineController: UIViewController {
    @IBOutlet weak var timelineCollectionView: UICollectionView!
    
    var timelineNames: [String] = ["Kevin Jonathan", "Kevin Jonathan"]
    var timelineDates: [String] = ["17:30 PM - 6 April 2021", "19:30 PM - 21 Maret 2021"]
    var timelineContents: [String] = ["Today, I have learnt about how to use AVFoundation framework. It is very interesting because I can play and record my voice using the AVRecorder and AVPlayer, cool! I learnt about this framework using Stackoverflow and Apple’s Documentation. With AVRecorder, we can just use .start(), .pause(), stop() to manage the recording session. It is not that hard whatsoever to implement this in our projects.", "Today, I have learnt about how to use UIKit framework. I struggled at first but I started to get the hang of it! I guess? But anyway, I want to share my experience in this timeline that Swift is relatively easy!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func addNewTimeline(_ sender: Any) {
        performSegue(withIdentifier: "toNewTimeline", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    

}

extension TimelineController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension TimelineController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = timelineCollectionView.dequeueReusableCell(withReuseIdentifier: "timelineCell", for: indexPath) as! TimelineCollectionViewCell
        
        cell.timelineName.text = timelineNames[indexPath.item]
        cell.timelineDate.text = timelineDates[indexPath.item]
        cell.timelineContent.text = timelineContents[indexPath.item]
        cell.timelineImage.layer.cornerRadius = 25
        
        return cell
    }
}
