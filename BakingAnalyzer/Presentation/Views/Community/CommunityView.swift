import SwiftUI

struct CommunityView: View {
    @EnvironmentObject private var themeManager: ThemeManager

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(0..<8) { index in
                        CommunityPostCard(index: index)
                    }
                }
                .padding()
            }
            .background(themeManager.backgroundColor.edgesIgnoringSafeArea(.all))
            .navigationTitle("Community")
        }
    }
}

struct CommunityPostCard: View {
    @EnvironmentObject private var themeManager: ThemeManager
    let index: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Circle()
                    .fill(Color.gray.opacity(0.4))
                    .frame(width: 40, height: 40)
                    .overlay(
                        Image(systemName: "person.fill")
                            .foregroundColor(.white.opacity(0.7))
                    )

                VStack(alignment: .leading, spacing: 2) {
                    Text("Baker \(index + 1)")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(themeManager.primaryTextColor)
                    Text("2 hours ago")
                        .font(.caption)
                        .foregroundColor(themeManager.secondaryTextColor)
                }

                Spacer()
            }

            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(maxWidth: .infinity)
                .frame(height: 180)
                .cornerRadius(10)
                .overlay(
                    Image(systemName: "photo")
                        .foregroundColor(.white.opacity(0.7))
                )

            Text("Just baked this sourdough – perfect crust and crumb!")
                .font(.body)
                .foregroundColor(themeManager.primaryTextColor)

            HStack(spacing: 20) {
                Label("24", systemImage: "heart")
                    .font(.caption)
                    .foregroundColor(themeManager.secondaryTextColor)
                Label("8", systemImage: "bubble.left")
                    .font(.caption)
                    .foregroundColor(themeManager.secondaryTextColor)
            }
        }
        .padding()
        .background(themeManager.secondaryBackgroundColor)
        .cornerRadius(12)
    }
}

struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView()
            .environmentObject(ThemeManager())
    }
}
