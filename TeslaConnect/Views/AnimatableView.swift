//
//  AnimatableView.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 9/3/22.
//

import Lottie
import SwiftUI

struct AnimatableView: UIViewRepresentable {
    
    var name: String
    var loopMode: LottieLoopMode = .playOnce
    var animationSpeed: CGFloat = 1.0

    var animationView = AnimationView()

    func makeUIView(context: UIViewRepresentableContext<AnimatableView>) -> UIView {
        let view = UIView(frame: .zero)

        animationView.animation = Animation.named(name)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.animationSpeed = animationSpeed
        animationView.play()

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)

        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<AnimatableView>) {}
}
