//
//  ContentView.swift
//  M5L7WebPageChallenge
//
//  Created by Wynn Bailey on 1/5/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
         WebPageView(url: URL(string: "https://codewithchris.com")!)
            .edgesIgnoringSafeArea(.bottom)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
