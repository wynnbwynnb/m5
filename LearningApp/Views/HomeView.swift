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
        NavigationView{
            VStack (alignment:.leading) {
                Text("What do you want to do today?")
                    .padding(.leading, 20)
                ScrollView {
                    LazyVStack {
                        ForEach(model.modules) { module in
                            //
                            // Learning Card
                            //
                            Spacer()
                            VStack (spacing: 20) {
                                NavigationLink(
                                    destination:
                                        ContentView().onAppear(perform: {
                                            model.beginModule(moduleID: module.id)
                                }),
                                    //  the currentContentSelected will get the tag
                                    //  when the destination is selected...
                                    //  setting the currentContentSelected to nil
                                    //  in the lessons will unwind
                                    tag: module.id,
                                    selection: $model.currentContentSelected,
                                    
                                    label:{
                                    HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) Lessons", time: module.content.time)
                              
                                })
                                
                            //
                            // Question Card
                            //
                                HomeViewRow(image: module.test.image, title: "\(module.category) Test", description: module.test.description, count: "\(module.test.questions.count) Questions", time: module.test.time)
                            }
                        }
                    }
                    .accentColor(.black)
                    .padding()
                }
            }
            .navigationTitle("Get Started")
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(ContentModel())
    }
}
