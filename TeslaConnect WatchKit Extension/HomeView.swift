//
//  HomeView.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 9/5/22.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
        VStack {
            Spacer()

            HStack(spacing: 8) {
                Image("model_s")
                    .resizable()
                    .aspectRatio(contentMode: .fit)

                VStack(alignment: .leading) {
                    Text("Starlight")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 18, weight: .medium))
                    Text("300 Miles")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)

                    HStack {
                        Image(systemName: "battery.75")
                            .foregroundColor(.green)
                            .font(.system(size: 13))
                        Text("80%")
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
                    }
                }
            }

            Spacer()

            HStack(spacing: 12) {
                ZStack {
                    Circle()
                        .fill(.white)
                        .frame(width: 45, height: 45)
                    Image(systemName: "lock.fill")
                        .font(.system(size: 18))
                        .padding(8)
                        .foregroundColor(.black)
                }

                ZStack {
                    Circle()
                        .fill(.white)
                        .frame(width: 45, height: 45)
                    Image(systemName: "fanblades.fill")
                        .font(.system(size: 18))
                        .padding(8)
                        .foregroundColor(.black)
                }
            }
        }
    }

}

struct HomeView_Preview: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
