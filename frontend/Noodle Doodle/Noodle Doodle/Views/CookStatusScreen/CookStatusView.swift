import SwiftUI

struct CookStatusView: View {
    let imageNames = ["Cooking3.1", "Cooking3.2"]
    @State private var currentIndex = 0
    @State private var isActive: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Your noodles are cooking!")
                    .font(Font.custom("Libra", size: 24))

                Image(imageNames[currentIndex])
                    .resizable()
                    .frame(width: 400, height: 400)
                    .onAppear { startImageAnimation() }
                
                NavigationLink(destination: MainView()) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 160, height: 60)
                            .background(Color(red: 0.77, green: 0.88, blue: 0.9))
                            .cornerRadius(60)
                        
                        Text("Cook more")
                            .font(Font.custom("Libra", size: 24))
                            .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.25))
                    }
                }
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    private func startImageAnimation() {
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
            withAnimation(.easeInOut(duration: 0)) {
                currentIndex = (currentIndex + 1) % imageNames.count
            }
        }
    }
}
