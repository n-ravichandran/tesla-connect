//
//  HomeView.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 9/3/22.
//

import SwiftUI

struct HomeView: View {

    @EnvironmentObject var appObject: AppObject
    @StateObject private var homeViewModel = HomeViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    if homeViewModel.showActivity {
                        ActivityView(isAnimating: $homeViewModel.showActivity, style: .medium)
                    } else {
                        VehicleCardView(
                            image: Image("model_y"),
                            name: "Starlight",
                            batteryLevel: "75%"
                        )
                        .padding()
                    }
                }
                .navigationTitle(Date.hourOfTheDayMessage)
                .toolbar {
                    ToolbarItem() {
                        Button {

                        } label: {
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                        }

                    }
                }
            }
            .onAppear {
                homeViewModel.loadVehicles()
            }
        }
    }

}


struct VehicleCardView: View {

    let image: Image
    let name: String
    let batteryLevel: String

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(name)
                        .font(Font.title2)
                    HStack() {
                        Image(systemName: "battery.75")
                            .font(.footnote)
                        Text(batteryLevel)
                            .font(.footnote)
                    }
                }
                Spacer()
            }
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.2), radius: 10, x: 0, y: 0)
    }

}
