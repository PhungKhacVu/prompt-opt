import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var themeManager: ThemeManager
    @State private var notificationsEnabled = true
    @State private var darkModeEnabled = true

    var body: some View {
        NavigationView {
            List {
                Section("Appearance") {
                    Toggle("Dark Mode", isOn: $darkModeEnabled)
                        .onChange(of: darkModeEnabled) { enabled in
                            themeManager.currentTheme = enabled ? .dark : .light
                        }
                        .listRowBackground(themeManager.secondaryBackgroundColor)
                }

                Section("Notifications") {
                    Toggle("Enable Notifications", isOn: $notificationsEnabled)
                        .listRowBackground(themeManager.secondaryBackgroundColor)
                }

                Section("Account") {
                    NavigationLink("Profile") {
                        Text("Profile Settings")
                            .foregroundColor(themeManager.primaryTextColor)
                    }
                    .listRowBackground(themeManager.secondaryBackgroundColor)

                    NavigationLink("Privacy") {
                        Text("Privacy Settings")
                            .foregroundColor(themeManager.primaryTextColor)
                    }
                    .listRowBackground(themeManager.secondaryBackgroundColor)
                }

                Section("About") {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("1.0.0")
                            .foregroundColor(themeManager.secondaryTextColor)
                    }
                    .listRowBackground(themeManager.secondaryBackgroundColor)
                }
            }
            .listStyle(.insetGrouped)
            .background(themeManager.backgroundColor)
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(ThemeManager())
    }
}
