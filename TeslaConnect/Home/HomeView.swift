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
            ZStack {
                if homeViewModel.showActivity {
                    ActivityView(isAnimating: $homeViewModel.showActivity, style: .medium)
                } else {
                    if let vehicle = homeViewModel.primaryVehicle {
                        ScrollView {
                            VStack {
                                VehicleCardView(
                                    image: Image("model_y"),
                                    name: vehicle.displayName,
                                    batteryLevel: "75%"
                                )
                                .padding()
                            }
                        }
                    } else {
                        NoCarsView()
                    }
                }
            }
            .navigationTitle(Date.hourOfTheDayMessage)
            .toolbar {
                ToolbarItem() {
                    Button {
                        appObject.logout()
                    } label: {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
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
                .aspectRatio(contentMode: .fit)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.2), radius: 10, x: 0, y: 0)
    }

}


struct NoCarsView: View {

    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "bolt.car")
                .font(.system(size: 25))
                .padding(8)
            Text("You do not have any cars in your tesla account.")
                .multilineTextAlignment(.center)
                .font(.callout)
            Spacer()
            Text("If you think this is an issue please reach out to the developer for assistance.")
                .multilineTextAlignment(.center)
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .padding()
    }

}
