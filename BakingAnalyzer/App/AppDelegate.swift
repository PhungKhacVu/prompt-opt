import UIKit
import CoreData

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        setupAppearance()
        return true
    }

    private func setupAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "primaryBlack")
        appearance.titleTextAttributes = [.foregroundColor: UIColor(named: "primaryWhite") ?? .white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "primaryWhite") ?? .white]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance

        UITabBar.appearance().backgroundColor = UIColor(named: "primaryBlack")
        UITabBar.appearance().unselectedItemTintColor = UIColor(named: "secondaryGray")
        UITabBar.appearance().tintColor = UIColor(named: "primaryOrange")
    }
}
