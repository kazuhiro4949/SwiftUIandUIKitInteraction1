//
//  PropertyView.swift
//  SwiftUIandUIKitInteraction1
//
//  Created by kazuhiro4949 on 2022/06/06.
//

import SwiftUI

struct PropertyView: View {
    var body: some View {
        Color.red
            .overlay(Text("Content"))
            .readable()
    }
}

struct PropertyView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PropertyView()
        }
        .previewDevice(PreviewDevice(rawValue: "iPhone 13"))
        
        NavigationView {
            PropertyView()
        }
        .previewDevice(PreviewDevice(rawValue: "iPhone 13"))
        .previewLayout(.fixed(width: 844, height: 390))
        
        
        NavigationView {
            PropertyView()
        }
        .navigationViewStyle(.stack)
        .previewDevice(PreviewDevice(rawValue: "iPad Pro (11-inch)"))
        .previewLayout(.fixed(width: 1024, height: 2048))

        NavigationView {
            PropertyView()
        }
        .navigationViewStyle(.stack)
        .previewDevice(PreviewDevice(rawValue: "iPad Pro (11-inch)"))
        .previewLayout(.fixed(width: 2048, height: 1024))
    }
}

