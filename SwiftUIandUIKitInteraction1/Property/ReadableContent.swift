//
//  ReadableContent.swift
//  SwiftUIandUIKitInteraction1
//
//  Created by kazuhiro4949 on 2022/06/06.
//

import SwiftUI

extension View {
    func readable() -> some View {
        self.modifier(ReadableModifier())
    }
}

struct ReadableModifier: ViewModifier {
    @State private var readableInsets: EdgeInsets = .init()
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(readableInsets)
            .background(ReadableContent(readableInsets: $readableInsets))
    }
}

struct ReadableContent: UIViewControllerRepresentable {
    @Binding var readableInsets: EdgeInsets
    
    func makeUIViewController(context: Context) -> ReadableContentViewController {
        ReadableContentViewController()
    }
    
    func updateUIViewController(_ uiViewController: ReadableContentViewController, context: Context) {
        uiViewController.onReadableContentGuideChange = { insets in
            readableInsets = insets
        }
    }
}

class ReadableContentViewController: UIViewController {
    var onReadableContentGuideChange: (EdgeInsets) -> Void = { _ in }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let layoutFrame = view.readableContentGuide.layoutFrame
        let readableContentInsets = EdgeInsets(
            top: layoutFrame.minY - view.frame.minY,
            leading: layoutFrame.minX - view.frame.minX,
            bottom: view.frame.maxY - layoutFrame.maxY,
            trailing: view.frame.maxX - layoutFrame.maxX
        )
        
        onReadableContentGuideChange(readableContentInsets)
    }
}

struct Readable_Previews: PreviewProvider {
    static var previews: some View {
        ReadableContent(readableInsets: .constant(EdgeInsets()))
    }
}

