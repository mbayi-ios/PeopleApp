//
//  SettingsView.swift
//  People
//
//  Created by Amby on 22/09/2022.
//

import SwiftUI

struct SettingsView: View {

    @AppStorage(UserDefaultKeys.hapticEnabled) private var isHapticsEnabled: Bool = true

    var body: some View {
        NavigationView {
            Form {
                haptics
            }
            .navigationBarTitle("Settings")
        }
    }
}

private extension SettingsView {
    var haptics: some View {
        Toggle("Enable Haptics", isOn: $isHapticsEnabled)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
