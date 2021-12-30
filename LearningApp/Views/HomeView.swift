//
//  ContentView.swift
//  LearningApp
//
//  Created by Wynn Bailey on 12/30/21.
//

import SwiftUI


struct HomeView: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
