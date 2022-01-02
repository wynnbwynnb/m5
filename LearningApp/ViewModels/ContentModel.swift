

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
}

