//
//  Learner.swift
//  DAcademy
//
//  Created by Kevin Jonathan on 03/05/21.
//

import Foundation

struct Learner {
    let name : String
    let photo : String
    let expertise : String
    let team : String
    let shift : String
    
    init(name: String,
         photo: String,
         expertise: String,
         team: String,
         shift: String) {
        self.name = name
        self.photo = photo
        self.expertise = expertise
        self.team = team
        self.shift = shift
    }
}

struct LearnerData: Decodable {
    let results: [Result]
}

struct Result: Decodable {
    let Name : String
    let Photo : String
    let Expertise : String
    let Team : String
    let Shift : String
}
