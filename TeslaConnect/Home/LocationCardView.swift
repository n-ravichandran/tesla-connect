//
//  LocationCardView.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 9/6/22.
//

import MapKit
import SwiftUI

// MARK: - LocationCardView

struct LocationCardView: View {

//    @GestureState private var isDetectingPress = false

    @Binding var viewModel: LocationCardViewModel

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "location.fill")
                Text("Location")
                    .font(.headline)
                Spacer()
                ActivityView(isAnimating: $viewModel.isUpdating)
            }
            Map(coordinateRegion: $viewModel.region, annotationItems: viewModel.annotations) { item in
                MapMarker(coordinate: item.coordinate, tint: .red)
            }
                .frame(height: 100)
                .cornerRadius(12)
                .padding(.horizontal, -5)
            Text(viewModel.address)
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.Fill.tileBackground)
        .cornerRadius(15)
        .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.2), radius: 10, x: 0, y: 0)
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

struct LocationCardView_Previews: PreviewProvider {
    static var previews: some View {
        LocationCardView(viewModel: .constant(LocationCardViewModel(
            lat: 40.7484,
            long: -73.9857,
            address: "Locating...",
            isUpdating: false
        )))
        .frame(width: 200)
    }
}
