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
        ScrollView {
            LazyVStack {
                ForEach(model.modules) { module in
                    //
                    // Learning Card
                    //
                    ZStack {
                        Rectangle()
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            //
                            //  This will scale the rectangle into the view
                            //
                            .aspectRatio(CGSize(width: 335, height: 175),contentMode: .fit)
                     
                        HStack {
                            // Image goes here
                            Image("swift")
                                .resizable()
                                .frame(width: 116, height: 116)
                                .clipShape(Circle())
                            Spacer()
                            VStack (alignment: .leading) {
                                Text("Learn Swift").bold()
                                Text("in 22 hours!")
                                    .padding(.bottom, 20)
                                
                                HStack{
                                    Image(systemName: "text.book.closed")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                    Text("20 Lessons").font(.caption)
                                    Image(systemName: "clock")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                    Text("2 hours").font(.caption)
                                }// hstack
                            }// vstack
                        }.padding(.horizontal, 20)// hstack
                    } // zstack
                } // for each
            } // lazy vsstack
        } // scroll view
    } // view
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(ContentModel())
    }
}
