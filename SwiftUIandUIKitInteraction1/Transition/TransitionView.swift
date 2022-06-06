//
//  TransitionView.swift
//  SwiftUIandUIKitInteraction1
//
//  Created by kazuhiro4949 on 2022/06/06.
//

import SwiftUI

struct TransitionView: View {
    @State private var isPresentingHalfModal = false
    @State private var isPresentingHalfModal2 = false
    @State private var isPresentingTextFieldAlert = false
    
    var body: some View {
        VStack(spacing: 16) {
            Button("Show HalfModal") {
                isPresentingHalfModal = true
            }
            .background {
                HalfModal(isPresenting: $isPresentingHalfModal) {
                    NavigationView {
                        Text("Content")
                            .navigationTitle("SwiftUI")
                            .toolbar {
                                ToolbarItem(placement: .navigationBarTrailing) {
                                    Button("Close") {
                                        isPresentingHalfModal = false
                                    }
                                }
                            }
                    }
                    .navigationViewStyle(.columns)
                }
            }
            
            Button("Show HalfModal2") {
                isPresentingHalfModal2 = true
            }
            .halfModal(isPresenting: $isPresentingHalfModal2) {
                NavigationView {
                    Text("Content")
                        .navigationTitle("SwiftUI")
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button("Close") {
                                    isPresentingHalfModal2 = false
                                }
                            }
                        }
                }.navigationViewStyle(.columns)
            }
            
            Button("Show Alert") {
                isPresentingTextFieldAlert = true
            }
            .textFieldAlert(isPresenting: $isPresentingTextFieldAlert,
                            title: "Title",
                            message: "Message") { textField in
                
                if let text = textField?.text {
                    print(text)
                }
            }
        }
    }
}

struct TransitionView_Previews: PreviewProvider {
    static var previews: some View {
        TransitionView()
    }
}
