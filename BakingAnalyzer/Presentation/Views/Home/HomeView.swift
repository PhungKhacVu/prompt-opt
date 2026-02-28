import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var themeManager: ThemeManager
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Search Bar
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(themeManager.secondaryTextColor)
                        TextField("Search recipes...", text: $searchText)
                            .foregroundColor(themeManager.primaryTextColor)
                    }
                    .padding()
                    .background(themeManager.secondaryBackgroundColor)
                    .cornerRadius(10)
                    .padding(.horizontal)

                    // Featured Recipes
                    VStack(alignment: .leading) {
                        Text("Featured Recipes")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(themeManager.primaryTextColor)
                            .padding(.horizontal)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(0..<5) { _ in
                                    FeaturedRecipeCard()
                                }
                            }
                            .padding(.horizontal)
                        }
                    }

                    // Recent Analyses
                    VStack(alignment: .leading) {
                        Text("Recent Analyses")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(themeManager.primaryTextColor)
                            .padding(.horizontal)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(0..<3) { _ in
                                    AnalysisCard()
                                }
                            }
                            .padding(.horizontal)
                        }
                    }

                    // My Recipes
                    VStack(alignment: .leading) {
                        Text("My Recipes")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(themeManager.primaryTextColor)
                            .padding(.horizontal)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(0..<4) { _ in
                                    RecipeCard()
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(.vertical)
            }
            .background(themeManager.backgroundColor.edgesIgnoringSafeArea(.all))
            .navigationTitle("Baking Analyzer")
            .navigationBarItems(
                trailing: Button(action: {
                    // Profile action
                }) {
                    Image(systemName: "person.crop.circle")
                        .foregroundColor(themeManager.accentColor)
                }
            )
        }
    }
}

struct FeaturedRecipeCard: View {
    @EnvironmentObject private var themeManager: ThemeManager

    var body: some View {
        VStack(alignment: .leading) {
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 280, height: 180)
                .cornerRadius(12)
                .overlay(
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white.opacity(0.7))
                )

            Text("Sourdough Bread")
                .font(.headline)
                .foregroundColor(themeManager.primaryTextColor)

            Text("Classic recipe with perfect crust")
                .font(.subheadline)
                .foregroundColor(themeManager.secondaryTextColor)
                .lineLimit(2)

            HStack {
                ForEach(0..<5) { i in
                    Image(systemName: i < 4 ? "star.fill" : "star")
                        .foregroundColor(themeManager.accentColor)
                        .font(.caption)
                }
                Spacer()
                Text("45 min")
                    .font(.caption)
                    .foregroundColor(themeManager.secondaryTextColor)
            }
        }
        .frame(width: 280)
        .padding()
        .background(themeManager.secondaryBackgroundColor)
        .cornerRadius(12)
    }
}

struct AnalysisCard: View {
    @EnvironmentObject private var themeManager: ThemeManager

    var body: some View {
        VStack(alignment: .leading) {
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 200, height: 150)
                .cornerRadius(12)
                .overlay(
                    Image(systemName: "chart.bar.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white.opacity(0.7))
                )

            Text("Whole Wheat Bread")
                .font(.headline)
                .foregroundColor(themeManager.primaryTextColor)

            HStack {
                Circle()
                    .fill(Color.green)
                    .frame(width: 10, height: 10)
                Text("Good crust color")
                    .font(.caption)
                    .foregroundColor(themeManager.secondaryTextColor)
            }

            HStack {
                Circle()
                    .fill(Color.orange)
                    .frame(width: 10, height: 10)
                Text("Moderate rise")
                    .font(.caption)
                    .foregroundColor(themeManager.secondaryTextColor)
            }
        }
        .frame(width: 200)
        .padding()
        .background(themeManager.secondaryBackgroundColor)
        .cornerRadius(12)
    }
}

struct RecipeCard: View {
    @EnvironmentObject private var themeManager: ThemeManager

    var body: some View {
        VStack(alignment: .leading) {
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 160, height: 120)
                .cornerRadius(12)
                .overlay(
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white.opacity(0.7))
                )

            Text("Croissant")
                .font(.headline)
                .foregroundColor(themeManager.primaryTextColor)

            Text("Buttery, flaky layers")
                .font(.caption)
                .foregroundColor(themeManager.secondaryTextColor)
                .lineLimit(1)
        }
        .frame(width: 160)
        .padding()
        .background(themeManager.secondaryBackgroundColor)
        .cornerRadius(12)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ThemeManager())
    }
}
