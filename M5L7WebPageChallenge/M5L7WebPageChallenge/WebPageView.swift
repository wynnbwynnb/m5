//
//  WebPageView.swift
//  M5L7WebPageChallenge
//
//  Created by Wynn Bailey on 1/5/22.
//

import SwiftUI
import WebKit

struct WebPageView: UIViewRepresentable {
    var url: URL
    func makeUIView(context: Self.Context) -> WKWebView {
        let myURL = (URL(string: "https://codewithchris.com")!)
        let webView = WKWebView()
        //let request = URLRequest(url: url)
        let request = URLRequest(url: myURL)
        webView.load(request)
        return webView
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
}
