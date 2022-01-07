//
//  SecondView.swift
//  NavigationDemo
//
//  Created by Wynn Bailey on 1/6/22.
//

import SwiftUI

struct SecondView: View {
    @Binding var selectedIndex:Int?
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Button("Navigate Back"){
                // TODO - code for navigate back button in second view
                print("From SecondView #1 selectedIndex: \(String(describing: selectedIndex))")
                selectedIndex = nil
                print("From SecondView #2 selectedIndex: \(String(describing: selectedIndex))")
            }
        }
    }
}

