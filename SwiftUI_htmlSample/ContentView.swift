//
//  ContentView.swift
//  SwiftUI_htmlSample
//
//  Created by Kazusa Kondo on 2023/05/10.
//

import SwiftUI
import WebKit

struct ContentView: View {
    
    var body: some View {
        VStack {
            // 問題文表示
            QuestionView(htmlString: sampleStr)
            .background(Color.green)
            .padding(.top, 5)// ToDoセーフエリア有無で変更する
            
            VStack {
                ForEach(1..<5) { index in
                        Button(action: {
                            print("タッチ\(index)")
                        }) {
                            SelectView(htmlString: "選択肢\(index)")
                                .background(Color.blue)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                    }
            }
            .padding(.bottom, 10)
            .frame(maxHeight: UIScreen.main.bounds.height / 3)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct QuestionView: UIViewRepresentable {
    let htmlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.isOpaque = false
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(htmlString, baseURL: Bundle.main.url(forResource: "@examframe", withExtension: "html"))
    }
}

struct SelectView: UIViewRepresentable {
    let htmlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.isOpaque = false
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(htmlString, baseURL: Bundle.main.url(forResource: "@examframe", withExtension: "html"))
    }
}
