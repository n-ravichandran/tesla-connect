//
//  VehicleCardView.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 9/4/22.
//

import SwiftUI

struct VehicleCardView: View {

    let image: Image
    let name: String
    let batteryLevel: String
    let batteryImageName: String

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(name)
                        .font(Font.title2)
                    HStack() {
                        Image(systemName: batteryImageName)
                            .font(.footnote)
                        Text(batteryLevel)
                            .font(.footnote)
                    }
                }
                Spacer()
            }
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(15)
                .clipped()
        }
        .padding()
        .background(Color.Fill.tileBackground)
        .cornerRadius(20)
        .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.2), radius: 10, x: 0, y: 0)
    }

}
