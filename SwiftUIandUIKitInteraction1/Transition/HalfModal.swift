//
//  HalfModal.swift
//  SwiftUIandUIKitInteraction1
//
//  Created by kazuhiro4949 on 2022/06/06.
//

import SwiftUI

struct HalfModal<Content>: UIViewControllerRepresentable where Content: View {
    @Binding var isPresenting: Bool
    @ViewBuilder var content: () -> Content
    
    func makeUIViewController(context: Context) -> UIViewController {
        UIViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if isPresenting && uiViewController.presentedViewController == nil {
            let hostingVC = UIHostingController(rootView: content())
            hostingVC.modalPresentationStyle = .pageSheet
            hostingVC.sheetPresentationController?.detents = [.medium(), .large()]
            hostingVC.presentationController?.delegate = context.coordinator
            uiViewController.present(hostingVC, animated: true)
        } else if !isPresenting && uiViewController.presentedViewController != nil {
            uiViewController.dismiss(animated: true)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UIAdaptivePresentationControllerDelegate {
        var parent: HalfModal
        
        init(parent: HalfModal) {
            self.parent = parent
        }
        
        func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
            parent.isPresenting = false
        }
    }
}

struct HalfModal_Previews: PreviewProvider {
    static var previews: some View {
        Color.clear.background {
            HalfModal(isPresenting: .constant(true)) {
                Text("Half Modal")
            }
        }
    }
}
