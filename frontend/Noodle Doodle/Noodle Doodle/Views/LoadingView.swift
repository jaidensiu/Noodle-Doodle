import SwiftUI

struct LoadingView: View {
    let imageNames = ["Loading1", "Loading2", "Loading3"]
    @State private var currentIndex = 0
    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image(imageNames[currentIndex])
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 100)
                    .edgesIgnoringSafeArea(.all)
                    .alignmentGuide(.leading) { d in d[.leading] }
                    .alignmentGuide(.top) { d in d[.top] }
                    .onAppear { startImageAnimation() }
                    .padding()
                
                Text("Loading...")
                    .padding()
            }
        }
    }
    
    private func startImageAnimation() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            withAnimation {
                currentIndex = (currentIndex + 1) % imageNames.count
            }
        }
    }
}
