//
//  ContentView.swift
//  SwiftUIandUIKitInteraction1
//
//  Created by kazuhiro4949 on 2022/06/06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("TransitionView") {
                    TransitionView()
                }
                NavigationLink("LifeCycleView") {
                    LifeCycleView()
                }
                NavigationLink("PropertyView") {
                    PropertyView()
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
