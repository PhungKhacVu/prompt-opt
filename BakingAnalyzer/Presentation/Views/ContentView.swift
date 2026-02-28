import SwiftUI

struct ContentView: View {
    @StateObject private var themeManager = ThemeManager()

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            AnalysisView()
                .tabItem {
                    Label("Analyze", systemImage: "camera.fill")
                }

            RecipeListView()
                .tabItem {
                    Label("Recipes", systemImage: "book.fill")
                }

            CommunityView()
                .tabItem {
                    Label("Community", systemImage: "person.3.fill")
                }

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
        .accentColor(themeManager.accentColor)
        .environmentObject(themeManager)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
