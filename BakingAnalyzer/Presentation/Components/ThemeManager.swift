import SwiftUI

enum AppTheme {
    case dark
    case light
}

class ThemeManager: ObservableObject {
    @Published var currentTheme: AppTheme = .dark

    var backgroundColor: Color {
        switch currentTheme {
        case .dark:
            return Color("primaryBlack")
        case .light:
            return Color("primaryWhite")
        }
    }

    var secondaryBackgroundColor: Color {
        switch currentTheme {
        case .dark:
            return Color("secondaryBlack")
        case .light:
            return Color("secondaryGray")
        }
    }

    var primaryTextColor: Color {
        switch currentTheme {
        case .dark:
            return Color("primaryWhite")
        case .light:
            return Color("primaryBlack")
        }
    }

    var secondaryTextColor: Color {
        switch currentTheme {
        case .dark:
            return Color("secondaryGray")
        case .light:
            return Color("disabledGray")
        }
    }

    var accentColor: Color {
        return Color("primaryOrange")
    }
}
