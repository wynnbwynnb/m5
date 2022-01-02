//
//  HomeViewRow.swift
//  LearningApp
//
//  Created by Wynn Bailey on 1/1/22.
//

import SwiftUI

struct HomeViewRow: View {
    // set the vars to be passed in
    var image: String
    var title: String
    var description: String
    var count: String
    var time: String
    
    var body: some View {
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
                Image(image)
                    .resizable()
                    .frame(width: 116, height: 116)
                    .clipShape(Circle())
                Spacer()
                VStack (alignment: .leading) {
                    Text(title)
                        .bold()
                    Text(description)
                        .padding(.bottom, 20)
                    
                    HStack{
                        Image(systemName: "text.book.closed")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(count).font(Font.system(size: 10))
                        Spacer()
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(time).font(Font.system(size: 10))
                    }// hstack
                }.padding(.leading, 20)// vstack
            }.padding(.horizontal, 20)// hstack
        } // zstack
    }
}

struct HomeViewRow_Previews: PreviewProvider {
    static var previews: some View {
        //
        // Note that the image string, "swift" is case senstive
        //
        HomeViewRow(image: "swift", title: "Learn Swift", description: "Some description", count: "99 Lessons", time: "99 hours")
    }
}
