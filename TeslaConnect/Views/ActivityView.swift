//
//  ActivityView.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 9/3/22.
//

import SwiftUI
import UIKit

struct ActivityView: UIViewRepresentable {

    @Binding var isAnimating: Bool
    var style: UIActivityIndicatorView.Style = .medium

    func makeUIView(context: UIViewRepresentableContext<ActivityView>) -> UIActivityIndicatorView {
        UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityView>) {
        if isAnimating {
            uiView.startAnimating()
            uiView.isHidden = false
        } else {
            uiView.stopAnimating()
            uiView.isHidden = true
        }
    }

}
