

//
//  ContentModel.swift
//  LearningApp
//
//  Created by Wynn Bailey on 12/30/21.
//

import Foundation

class ContentModel: ObservableObject {
    //
    // The @Published lets the view that is using the object to react to changes
    //
    @Published var modules = [Module]() // and empty array of modules
    //
    //  We want to keep track of the module type and lesson or test
    @Published var currentModule: Module?
    var currentModuleIndex = 0 // referenced as: currentModule = modules[currentModuleIndex]
    //
    // Set some state vars for the current lesson
    //
    @Published var currentLesson: Lesson?
    //
    // Current lesson explaination in HTML
    //
    @Published var lessonDescription = NSAttributedString()
    //
    // Current selected content and test (our set to nil to unwind guy)
    //
    @Published var currentContentSelected:Int?
    
    var currentLessonIndex = 0
    
    var styleData: Data? // nil optional
    init(){
        getLocalData()
    }
    // MARK: Data Methods
    func getLocalData(){
        //
        // Get a url to the json file
        //
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        //
        // Read the file into a data object
        //
        do {
            let jsonData = try Data(contentsOf: jsonUrl!)
            //
            // Try to decode the json into an array of modules (tricky code here, be carful!)
            //
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            //
            // Assign parsed local modules to the modules "property" that is @Published
            //
            self.modules = modules
        }
        catch {
            //
            // Log error... could be caised by mis-matched spelling between json file and model
            //
            print("error reading json into a data object")
        }
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            let styleData = try Data(contentsOf: styleUrl!)
            self.styleData = styleData
            
        }
        catch {
            //
            // Log error...
            //
            print("error reading style data")
        }

    }
    
    // MARK: Module Navigation Methods
    
    func beginModule (moduleID: Int){
        //
        //  Find the index
        //
        for index in 0..<modules.count{
            if modules[index].id == moduleID {
                currentModuleIndex = index
                break // found it!
            }
        }
        // Set the current module
        //
        currentModule = modules[currentModuleIndex]
        
        
    }
    func beginLesson(lessonIndex:Int){
        //
        // check lesson index for range
        //
        if lessonIndex < currentModule!.content.lessons.count {
            currentLessonIndex = lessonIndex
        }
        else {
            currentLessonIndex = 0
        }
        //
        // set current index
        //
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
        lessonDescription = addStyling(htmlString: currentLesson!.explanation)
    }
    func hasNextLesson() -> Bool {
        return currentLessonIndex + 1 < currentModule!.content.lessons.count
    }
    func nextLesson(){
        //
        // Advance the lesson
        //
        currentLessonIndex += 1
        //
        // Check if range ok
        //
        if(currentLessonIndex < currentModule!.content.lessons.count){
            //
            // Set the current lesson to next
            //
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
            lessonDescription = addStyling(htmlString: currentLesson!.explanation)
        }
        else {
            // Reset the lesson state
            //
            currentLessonIndex = 0
            currentLesson = nil
        }
        
    }
    private func addStyling( htmlString: String) -> NSAttributedString {
        var resultString = NSAttributedString()
        var data = Data()
        //
        // Styling Data
        //
        if(styleData != nil){
            data.append(styleData!)
        }
        // HTML Data (create a data object and append it to our data object
        //
        data.append(Data(htmlString.utf8))
        //
        // Convert to attributed string with a do catch block!
        //
        /*do {
            let attributedString = try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
                resultString = attributedString
            
        }
        catch {
            print("broke on converting html to attributed string")
        }*/
        // Same code without do catch. If the try? fails the resultString is not set.
        //
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil){
            resultString = attributedString
        }
        return resultString
    }
}

