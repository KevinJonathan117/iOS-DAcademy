//
//  NewTimelineController.swift
//  DAcademy
//
//  Created by Kevin Jonathan on 05/05/21.
//

import UIKit

protocol doneDelegate {
    func reloadCollectionView(data: String)
}

class NewTimelineController: UIViewController {
    
    var delegate: doneDelegate?

    @IBOutlet weak var timelineTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        timelineTextView.textColor = .lightGray
        timelineTextView.text = "What's new? start typing here..."
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func doneButton(_ sender: UIBarButtonItem) {
        let trimmed = timelineTextView.text.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmed != "What's new? start typing here..." && trimmed != "" {
            let newTimeline = Timeline(name: "Kevin Jonathan", date: "7:30 - 6 May 2021", content: trimmed)
            timelineDatabase.timelineData = timelineDatabase.timelineData.reversed()
            timelineDatabase.timelineData.append(newTimeline)
            timelineDatabase.timelineData = timelineDatabase.timelineData.reversed()
            
            let setReload = "true"
            
            delegate?.reloadCollectionView(data: setReload)

            navigationController?.popViewController(animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

extension NewTimelineController: UITextViewDelegate {
    func textViewDidBeginEditing (_ textView: UITextView) {
        if timelineTextView.textColor == .lightGray && timelineTextView.isFirstResponder {
            timelineTextView.text = nil
            timelineTextView.textColor = .black
        }
    }
    
    func textViewDidEndEditing (_ textView: UITextView) {
        if timelineTextView.text.isEmpty || timelineTextView.text == "" {
            timelineTextView.textColor = .lightGray
            timelineTextView.text = "What's new? start typing here..."
        }
    }
}
