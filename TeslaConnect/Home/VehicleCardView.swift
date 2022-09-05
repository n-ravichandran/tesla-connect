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
    let batteryColor: Color
    let mileRange: String = "275 Miles"

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(name)
                        .font(Font.title2)
                    HStack() {
                        Image(systemName: batteryImageName)
                            .font(.footnote)
                            .foregroundColor(batteryColor)
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

            HStack {
                Text("Battery Range: \(mileRange)")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .opacity(0.9)
            }
        }
        .padding()
        .background(Color.Fill.tileBackground)
        .cornerRadius(20)
        .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.2), radius: 10, x: 0, y: 0)
    }

}

struct VehicleCardView_Preview: PreviewProvider {

    static var previews: some View {
        VehicleCardView(
            image: Image("model_x"),
            name: "Falcon",
            batteryLevel: "80%",
            batteryImageName: "battery.75",
            batteryColor: .green
        )
        .padding()
    }

}
