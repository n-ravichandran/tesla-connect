//
//  WatchCommandButtonStyle.swift
//  TeslaConnect Watch WatchKit Extension
//
//  Created by Niranjan Ravichandran on 9/5/22.
//

import SwiftUI

struct WatchCommandButtonStyle: ButtonStyle {

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.65 : 1.0)
    }
    
}

struct CommandButton_Preview: PreviewProvider {
    static var previews: some View {
        Button {

        } label: {
            ZStack {
                Image(systemName: "lock.fill")
                    .font(.system(size: 18))
                    .padding(8)
                    .foregroundColor(.black)
            }
        }.buttonStyle(WatchCommandButtonStyle())
    }
}
