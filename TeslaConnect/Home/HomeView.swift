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
    @State private var showSettings = false

    var body: some View {
        NavigationView {
            ZStack {
                if homeViewModel.showActivity {
                    ActivityView(isAnimating: $homeViewModel.showActivity, style: .medium)
                } else {
                    if let vehicle = homeViewModel.primaryVehicle {
                        ScrollView {
                            VStack(spacing: 20) {
                                VehicleCardView(
                                    image: Image(vehicle.imageName),
                                    name: vehicle.displayName,
                                    batteryLevel: vehicle.batteryLevelString,
                                    batteryImageName: vehicle.batteryLevelImageName,
                                    batteryColor: vehicle.batteryColor
                                )

                                HStack(spacing: 20) {
                                    CommandButton(
                                        title: $homeViewModel.unlockCardViewModel.title,
                                        iconName: $homeViewModel.unlockCardViewModel.iconName
                                    ) {
                                        homeViewModel.toggleLockState()
                                    }
                                    .frame(maxWidth: .infinity)

                                    CommandButton(
                                        title: .constant("Open Frunk"),
                                        iconName: .constant("car.fill")
                                    ) {

                                    }
                                    .frame(maxWidth: .infinity)

                                    CommandButton(
                                        title: .constant("Climate"),
                                        iconName: .constant("fanblades.fill")
                                    ) {

                                    }
                                    .frame(maxWidth: .infinity)
                                }


                                HStack(spacing: 15) {
                                    LocationCardView(viewModel: $homeViewModel.locationCardViewModel)
                                        .frame(maxWidth: .infinity)

                                    ClimateCardView(
                                        temperatureString: vehicle.interiorTemperature,
                                        isAnyWindowOpen: vehicle.isAnyWindowOpen
                                    ).frame(maxWidth: .infinity)
                                }
                            }
                            .padding()
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
                        showSettings.toggle()
                    } label: {
                        Image(systemName: "ellipsis")
                    }

                }
            }
            .onAppear {
                homeViewModel.loadVehicles()
            }
            .sheet(isPresented: $showSettings) {
                SettingsView()
            }
        }
        .accentColor(.Tint.navigationBar)
    }
}

struct CommandButton: View {

    @Binding var title: String
    @Binding var iconName: String
    var action: (() -> Void)?

    var body: some View {
        Button {
            action?()
        } label: {
            ZStack {
                Circle()
                    .fill(Color.Fill.commandButton)
                    .frame(width: 50, height: 50)
                Image(systemName: iconName)
                    .font(.system(size: 20))
                    .padding(8)
                    .foregroundColor(Color.Text.commandButtonText)
            }
            Text(title)
                .font(.footnote)
        }.buttonStyle(OpacityButtonStyle())

    }

}

// MARK: - ClimateCardView

struct ClimateCardView: View {

    var temperatureString: String
    var isAnyWindowOpen: Bool

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Climate")
                        .font(.headline)
                    Text("EXTERIOR: N/A")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                Spacer()
            }

            Spacer()

            HStack {
                Text(temperatureString)
                    .font(.system(size: 40, weight: .regular))
                Spacer()
                Image(systemName: "snowflake") // Todo: Update icon based on heat/cool
                    .foregroundColor(.blue)
            }
            .padding(.vertical, 4)

            Text("Windows \(isAnyWindowOpen ? "Open" : "Closed")")
                .font(.callout)
        }
        .padding()
        .background(Color.Fill.tileBackground)
        .cornerRadius(15)
        .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.2), radius: 10, x: 0, y: 0)
    }

}

// MARK: - NoCarsView

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
