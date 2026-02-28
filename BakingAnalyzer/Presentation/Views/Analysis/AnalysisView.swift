import SwiftUI

struct AnalysisView: View {
    @EnvironmentObject private var themeManager: ThemeManager
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?

    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                // Image upload area
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(themeManager.secondaryBackgroundColor)
                        .frame(height: 260)

                    if let image = selectedImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 260)
                            .cornerRadius(16)
                            .clipped()
                    } else {
                        VStack(spacing: 12) {
                            Image(systemName: "camera.viewfinder")
                                .font(.system(size: 56))
                                .foregroundColor(themeManager.accentColor)
                            Text("Tap to add a photo of your bake")
                                .foregroundColor(themeManager.secondaryTextColor)
                        }
                    }
                }
                .onTapGesture {
                    showImagePicker = true
                }
                .padding(.horizontal)

                Button("Analyze") {
                    // Trigger AI analysis
                }
                .buttonStyle(PrimaryButtonStyle())
                .disabled(selectedImage == nil)
                .padding(.horizontal)

                Spacer()
            }
            .padding(.top)
            .background(themeManager.backgroundColor.edgesIgnoringSafeArea(.all))
            .navigationTitle("Analyze")
        }
    }
}

struct AnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        AnalysisView()
            .environmentObject(ThemeManager())
    }
}
