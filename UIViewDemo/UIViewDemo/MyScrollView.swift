//
//  MyScrollView.swift
//  UIViewDemo
//
//  Created by 이종민 on 1/23/25.
//

import SwiftUI

struct MyScrollView: UIViewRepresentable {
    var text: String
    
    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.refreshControl = UIRefreshControl()
        let myLabel = UILabel(frame: CGRect(x:0, y: 0, width: 300, height: 50))
        myLabel.text = text
        scrollView.addSubview(myLabel)
        return scrollView
    }
    
    
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
    }
}

#Preview {
    MyScrollView(text: "Hello world")
}
