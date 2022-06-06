//
//  HalfModalModifier.swift
//  SwiftUIandUIKitInteraction1
//
//  Created by kazuhiro4949 on 2022/06/06.
//

import SwiftUI

extension View {
    func halfModal<Content>(isPresenting: Binding<Bool>, @ViewBuilder content: @escaping () -> Content) -> some View where Content: View {
        modifier(HalfModalModifier(isPresenting: isPresenting, presented: content))
    }
}

struct HalfModalModifier<Presented>: ViewModifier where Presented: View {
    @Binding var isPresenting: Bool
    @ViewBuilder var presented: () -> Presented
    
    func body(content: Content) -> some View {
        content.background {
            HalfModal(isPresenting: $isPresenting, content: presented)
        }
    }
}

struct HalfModalModifier_Previews: PreviewProvider {
    static var previews: some View {
        Color.clear.halfModal(isPresenting: .constant(true)) {
            Text("Text")
        }
    }
}
