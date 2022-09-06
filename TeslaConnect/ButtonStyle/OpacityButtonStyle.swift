//
//  OpacityButtonStyle.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 9/6/22.
//

import SwiftUI

struct OpacityButtonStyle: ButtonStyle {

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.65 : 1.0)
    }

}
