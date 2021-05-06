//
//  TimelineDetailController.swift
//  DAcademy
//
//  Created by Kevin Jonathan on 05/05/21.
//

import UIKit
import NaturalLanguage

class TimelineDetailController: UIViewController {

    @IBOutlet weak var timelineDetailImage: UIImageView!
    @IBOutlet weak var timelineDetailName: UILabel!
    @IBOutlet weak var timelineDetailDate: UILabel!
    @IBOutlet weak var timelineDetailContent: UILabel!
    @IBOutlet weak var timelineDetailMoodLevel: UILabel!
    
    var name = ""
    var date = ""
    var content = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timelineDetailImage.layer.cornerRadius = 25
        moodAnalysis()
        timelineDetailName.text = name
        timelineDetailDate.text = date
        timelineDetailContent.text = content
        // Do any additional setup after loading the view.
    }
    
    func moodAnalysis() {
        //check if the language is english or not
        let languageRecog = NLLanguageRecognizer()
        
        languageRecog.processString(content)
        //if english, use the mood analysis
        if languageRecog.dominantLanguage!.rawValue == "en" {
            let tagger = NLTagger(tagSchemes: [.sentimentScore])
            tagger.string = content
            
            let sentiment = tagger.tag(at: content.startIndex, unit: .paragraph, scheme: .sentimentScore).0
            
            let score = Double(sentiment?.rawValue ?? "0") ?? 0
            var emoji = ""
            
            if(score == 0) {
                emoji = "🙂"
            } else if score < 0{
                emoji = "😢"
            } else {
                emoji = "😁"
            }
            timelineDetailMoodLevel.text = "Mood Level: \(emoji)"
            print(score)
        } else {
            //if not english, display nothing, because sentiment analysis only supports 7 languages (including english).
            timelineDetailMoodLevel.text = ""
        }
        
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
