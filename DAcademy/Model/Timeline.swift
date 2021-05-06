//
//  Timeline.swift
//  DAcademy
//
//  Created by Kevin Jonathan on 05/05/21.
//

import Foundation

struct Timeline {
    var name : String
    var date : String
    var content : String
    
    init(name: String, date: String, content: String) {
        self.name = name
        self.date = date
        self.content = content
    }
}

struct TimelineDatabase {
    var timelineData = [Timeline]()
}

var timelineDatabase = TimelineDatabase()

