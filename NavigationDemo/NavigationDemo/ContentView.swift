//
//  ContentView.swift
//  NavigationDemo
//
//  Created by Wynn Bailey on 1/6/22.
//

import SwiftUI

struct ContentView: View {
    //
    // This state var needs to show up as a nil when we refresh this view
    //
    @State var selectedIndex:Int?
    
    var body: some View {
        Text("From Content View selectedIndex: \(String(describing: selectedIndex))")
        
        NavigationView {
            
            //
            //  This is a pair of navigation links to the second view
            //  These links have "tags"
            VStack(spacing: 20) {
                NavigationLink(
                    destination: SecondView(selectedIndex: $selectedIndex)
                        .onAppear(perform:{
                            print(selectedIndex!)
                        }),
                    tag: 1,                     // when selected, will write
                    selection: $selectedIndex,  // tag into index as binding
                    label: {
                        Text("Navigation Link 1")
                })
                NavigationLink(
                    destination: SecondView(selectedIndex: $selectedIndex)
                        .onAppear(perform:{
                            print(selectedIndex!)
                        }),
                    tag: 2,
                    selection: $selectedIndex, // as a binding
                    label: {
                        Text("Navigation Link 2")
                })

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
/*
 NavigationView {
     //
     //  This is a pair of navigation links to the second view
     //
     VStack(spacing: 20) {
         NavigationLink(destination: SecondView(),
             label: {
                 Text("Navigation Link 1")
         })
         NavigationLink(destination: SecondView(),
             label: {
                 Text("Navigation Link 2")
         })

     }
 } */
