import SwiftUI

@main
struct BakingAnalyzerApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext,
                              CoreDataStack.shared.viewContext)
        }
    }
}
