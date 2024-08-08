//
//  SettingsView.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 9/6/22.
//

import SwiftUI

private enum Option: String, Identifiable, CaseIterable {
    case name = "User"
    case logout = "Logout"

    var id: Self { self }

    var color: Color {
        switch self {
        case .name: return .primary
        case .logout: return .red
        }
    }

    var iconName: String {
        switch self {
        case .name: return "person"
        case .logout: return "rectangle.portrait.and.arrow.right"
        }
    }
}

struct SettingsView: View {
    @EnvironmentObject var appObject: AppObject
    @Environment(\.presentationMode) var presentationMode
    @State private var showLogoutAlert = false

    @StateObject private var viewModel = SettingsViewModel()

    var body: some View {
        NavigationView {
            List(Option.allCases, id: \.self) { option in
                Button {
                    didSelect(option: option)
                } label: {
                    HStack {
                        Image(systemName: option.iconName)
                            .foregroundColor(option.color)
                        Text(option.rawValue)

                        if option == .name {
                            Spacer()
                            Text(viewModel.name)
                                .foregroundStyle(Color.gray)
                        }
                    }
                }
                .buttonStyle(OpacityButtonStyle())

            }
            .listStyle(.insetGrouped)
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem() {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                    }
                }
            }
            .alert("Would you like to logout from Tesla?", isPresented: $showLogoutAlert) {
                Button("Cancel", role: .cancel) {}
                Button("Logout", role: .destructive) {
                    logout()
                }
            }
        }
        .accentColor(.Tint.navigationBar)
    }

    private func didSelect(option: Option) {
        switch option {
        case .name: break
        case .logout:
            showLogoutAlert = true
        }
    }

    private func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }

    private func logout() {
        dismiss()
        appObject.logout()
    }
}
