//
//  TextFieldAlert.swift
//  SwiftUIandUIKitInteraction1
//
//  Created by kazuhiro4949 on 2022/06/06.
//

import SwiftUI

extension View {
    func textFieldAlert(isPresenting: Binding<Bool>, title: String, message: String?, action: @escaping (UITextField?) -> Void) -> some View {
        modifier(TextFieldAlertModifier(isPresenting: isPresenting, title: title, message: message, action: action))
    }
}

struct TextFieldAlertModifier: ViewModifier {
    @Binding var isPresenting: Bool
    
    let title: String?
    let message: String?
    let action: (UITextField?) -> Void
    
    func body(content: Content) -> some View {
        content.background {
            TextFieldAlert(
                isPresenting: $isPresenting,
                title: title,
                message: message,
                action: action)
        }
    }
}

private struct TextFieldAlert: UIViewControllerRepresentable {
    @Binding var isPresenting: Bool
    
    let title: String?
    let message: String?
    let action: (UITextField?) -> Void
    
    func makeUIViewController(context: Context) -> some UIViewController {
        UIViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        if isPresenting && uiViewController.presentedViewController == nil {
            let alertController = UIAlertController(
                title: title,
                message: message,
                preferredStyle: .alert)
            alertController.addTextField()
            alertController.addAction(UIAlertAction(
                title: "キャンセル",
                style: .cancel,
                handler: { _ in
                    isPresenting = false
                }))
            alertController.addAction(UIAlertAction(
                title: "OK",
                style: .default,
                handler: { _ in
                    action(alertController.textFields?.first)
                    isPresenting = false
                }))
            uiViewController.present(alertController, animated: true)
        } else if !isPresenting && uiViewController.presentedViewController != nil {
            uiViewController.dismiss(animated: true)
        }
    }
}

struct TextFieldAlert_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldAlert(isPresenting: .constant(false), title: "title", message: "message") { textField in
            
        }
    }
}
