//
//  PrimaryButtonStyle.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 9/1/22.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.body.bold())
            .padding([.trailing, .leading], 35)
            .padding([.top, .bottom], 15)
            .foregroundColor(.white)
            .background(configuration.isPressed ? Color.blue.opacity(0.9) : Color.blue)
            .cornerRadius(25)
    }

}
