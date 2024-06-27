//
//  MapView.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 9/6/22.
//

import MapKit
import SwiftUI

struct MapView: View {

    @Binding var region: MKCoordinateRegion

//    init(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
//        region = MKCoordinateRegion(
//            center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude),
//            span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
//        )
//    }

//    init(region: MKCoordinateRegion) {
//        self.region = region
//    }

    var body: some View {
        Map(coordinateRegion: $region)
    }
}

#Preview {
    MapView(
        region: .constant(
            .init(
                center: .init(latitude: 40.7484, longitude: -73.9857),
                span: .init(latitudeDelta: 0.03, longitudeDelta: 0.03)
            )
        )
    )
}
