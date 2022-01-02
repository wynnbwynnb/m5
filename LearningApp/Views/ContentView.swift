//
//  ContentView.swift
//  LearningApp
//
//  Created by Wynn Bailey on 1/2/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ScrollView{
            LazyVStack{
                //
                //  Confirm we have a module to work with
                //
                if model.currentModule != nil {
                    ForEach(0..<model.currentModule!.content.lessons.count){ index in
                      ContentViewRow(index: index)
                    }
                }
            }
            .padding()
            .navigationTitle("Learn \(model.currentModule?.category ?? "")")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
