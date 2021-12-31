//
//  Models.swift
//  LearningApp
//
//  Created by Wynn Bailey on 12/31/21.
//
// This is the set of models that we parse the json data file into
// Note: Any misspellings of the vars result in the json parsing to crash
//       So,var questions: [Question]
//          var questionss: [Question]
//       WILL throw the try to parse!

import Foundation

struct Module : Decodable, Identifiable {
    
    var id: Int
    var category: String
    var content: Content
    var test: Test
}

struct Content : Decodable, Identifiable {
    
    var id: Int
    var image: String
    var time: String
    var description: String
    var lessons: [Lesson]
}
struct Lesson : Decodable, Identifiable {
    
    var id: Int
    var title: String
    var video: String
    var duration: String
    var explanation: String
}
struct Test : Decodable, Identifiable {
    
    var id: Int
    var image: String
    var time: String
    var description: String
    var questions: [Question]
    //var questionss: [Question]
}
struct Question : Decodable, Identifiable {
    
    var id: Int
    var content: String
    var correctIndex: Int
    var answers: [String]
}
