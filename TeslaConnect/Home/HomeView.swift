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
                            VStack(spacing: 20) {
                                VehicleCardView(
                                    image: Image(vehicle.imageName),
                                    name: vehicle.displayName,
                                    batteryLevel: vehicle.batteryLevelString,
                                    batteryImageName: vehicle.batteryLevelImageName
                                )

                                HStack(spacing: 20) {
                                    CommandCardView(
                                        title: $homeViewModel.unlockCardViewModel.title,
                                        iconName: $homeViewModel.unlockCardViewModel.iconName
                                    ) {
                                        homeViewModel.toggleLockState()
                                    }
                                    .frame(maxWidth: .infinity)

                                    CommandCardView(
                                        title: .constant("Open Frunk"),
                                        iconName: .constant("car.fill")
                                    ) {

                                    }
                                    .frame(maxWidth: .infinity)

                                    CommandCardView(
                                        title: .constant("Climate"),
                                        iconName: .constant("fanblades.fill")
                                    ) {

                                    }
                                    .frame(maxWidth: .infinity)
                                }


                                HStack(alignment: .top) {
                                    LocationCardView(locationString: "N/A")
                                        .frame(maxWidth: .infinity)

                                    ClimateCardView(
                                        temperatureString: vehicle.interiorTemperatureString,
                                        isAnyWindowOpen: vehicle.isAnyWindowOpen
                                    )
                                        .frame(maxWidth: .infinity)
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

struct CommandCardView: View {

//    @GestureState private var isDetectingPress = false
    @Binding var title: String
    @Binding var iconName: String
    var action: (() -> Void)?

    var body: some View {
        VStack {
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
        }
        .onTapGesture {
            action?()
        }
//        .scaleEffect(isDetectingPress ? 0.95 : 1.0)
//        .gesture (
//            LongPressGesture(minimumDuration: 1.0)
//                .updating($isDetectingPress) { currentstate, gestureState, transaction in
//                    transaction.animation = Animation.easeInOut(duration: 0.2)
//                    gestureState = currentstate
//                }
//        )
    }

}

// MARK: - ClimateCardView

struct ClimateCardView: View {

    var temperatureString: String
    var isAnyWindowOpen: Bool

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Climate")
                        .font(.title3)
                    Text("EXTERIOR: N/A")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                Spacer()
            }

            Spacer(minLength: 15)

            HStack {
                Text(temperatureString)
                    .font(.title)
                Spacer()
                Image(systemName: "snowflake") // Todo: Update icon based on heat/cool
                    .foregroundColor(.blue)
            }
            .padding(.vertical, 4)

            Text("Windows \(isAnyWindowOpen ? "Open" : "Closed")")
        }
        .padding()
        .background(Color.Fill.tileBackground)
        .cornerRadius(15)
        .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.2), radius: 10, x: 0, y: 0)
    }

}

// MARK: - LocationCardView

struct LocationCardView: View {

    var locationString: String

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "location.fill")
                Text("Location")
                    .font(.title3)
            }
            Spacer()
            Text(locationString)
                .font(.footnote)
                .foregroundColor(.gray)
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
