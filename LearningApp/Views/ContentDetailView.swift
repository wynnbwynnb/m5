//
//  ContentDetailView.swift
//  LearningApp
//
//  Created by Wynn Bailey on 1/2/22.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    @EnvironmentObject var model: ContentModel
    var body: some View {
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoHostUrl2 + (lesson?.video ?? ""))


        VStack {
            if url != nil {
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
            }
            // Lesson Description as HTML
            //
            CodeTextView()
            if model.hasNextLesson(){
                Button(action :{
                    model.nextLesson()
                    
                }, label: {
                    ZStack{
                        RectangleCard(color: Color.green)
                            .frame(height:48)
                            
                    
                        Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                            .foregroundColor(.white)
                            .bold()
                    }
                })
            }
            else {
                // show complete button
                Button(action :{
                    // back to home view
                    model.currentContentSelected = nil
                }, label: {
                    ZStack{
                        RectangleCard(color: Color.gray)
                            .frame(height:48)
                            
                    
                        Text("Completed")
                            .foregroundColor(.white)
                            .bold()
                    }
                })
            }
        }
        .padding()
        .navigationBarTitle(lesson?.title ?? "")
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
