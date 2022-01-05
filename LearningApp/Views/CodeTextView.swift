//
//  CodeTextView.swift
//  LearningApp
//
//  Created by Wynn Bailey on 1/5/22.
//

import SwiftUI



struct CodeTextView: UIViewRepresentable {
    
    @EnvironmentObject var model: ContentModel
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.isEditable = false
        return textView
    }
    func updateUIView(_ textView: UITextView, context: Context) {
        //
        //  Set the text for the lesson
        //
        //textView.text = "Testing"
        textView.attributedText = model.lessonDescription
        //
        // start from the top by creating a tiny rect at the top to force the scroll up
        //
        textView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: false)
        
    }
}

struct CodeTextView_Previews: PreviewProvider {
    static var previews: some View {
        CodeTextView()
    }
}
