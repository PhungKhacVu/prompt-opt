import SwiftUI

struct RecipeListView: View {
    @EnvironmentObject private var themeManager: ThemeManager
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(0..<10) { index in
                    HStack(spacing: 12) {
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 60, height: 60)
                            .cornerRadius(8)
                            .overlay(
                                Image(systemName: "photo")
                                    .foregroundColor(.white.opacity(0.7))
                            )

                        VStack(alignment: .leading, spacing: 4) {
                            Text("Recipe \(index + 1)")
                                .font(.headline)
                                .foregroundColor(themeManager.primaryTextColor)
                            Text("Baked on Feb 20, 2026")
                                .font(.caption)
                                .foregroundColor(themeManager.secondaryTextColor)
                        }

                        Spacer()

                        Image(systemName: "chevron.right")
                            .foregroundColor(themeManager.secondaryTextColor)
                    }
                    .padding(.vertical, 4)
                    .listRowBackground(themeManager.secondaryBackgroundColor)
                }
            }
            .listStyle(.plain)
            .background(themeManager.backgroundColor)
            .navigationTitle("Recipes")
            .searchable(text: $searchText, prompt: "Search recipes")
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(ThemeManager())
    }
}
