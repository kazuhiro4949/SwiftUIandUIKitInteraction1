//
//  LifeCycleView.swift
//  SwiftUIandUIKitInteraction1
//
//  Created by kazuhiro4949 on 2022/06/06.
//

import SwiftUI
import Combine

struct LifeCycleView: View {
    @State private var isShow = false
    
    var body: some View {
        Button("show") {
            isShow.toggle()
        }
        if isShow {
            Rectangle().fill(.red).frame(width: 200, height: 200)
                .background(LifeCycle())
        }
    }
}

struct LifeCycle: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        LifeCycleViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}

class LifeCycleViewController: UIViewController {
    var cancellableSet = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        Logger().send(message: "viewDidLoad")
        
        configureAppLifeCycle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Logger().send(message: "viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Logger().send(message: "viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Logger().send(message: "viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        Logger().send(message: "viewDidDisappear")
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        Logger().send(message: "viewWillTransition")
    }
    
    private func configureAppLifeCycle() {
        NotificationCenter.default
            .publisher(for: UIApplication.didBecomeActiveNotification)
            .sink { _ in
                Logger().send(message: "didBecomeActive")
                print("verbose", "didBecomeActive")
            }.store(in: &cancellableSet)
        NotificationCenter.default
            .publisher(for: UIApplication.willResignActiveNotification)
            .sink { _ in
                Logger().send(message: "willResignActive")
            }.store(in: &cancellableSet)
    }
}

class Logger {
    func send(message: String) {
        print("⛔️", message)
    }
}

struct LifeCycle_Previews: PreviewProvider {
    static var previews: some View {
        LifeCycle()
    }
}
