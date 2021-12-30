//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Wynn Bailey on 12/30/21.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(ContentModel())
        }
    }
}
