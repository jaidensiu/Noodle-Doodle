import SwiftUI

struct StartView: View {
    let imageNames = [
        "Tossing1",
        "Tossing2",
        "Tossing3",
        "Tossing4",
        "Tossing5",
        "Tossing6",
        "Tossing7",
        "Tossing8",
        "Tossing9",
        "Tossing10",
        "Tossing11",
        "Tossing12",
        "Tossing13"
    ]
    @State private var currentIndex = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Noodle\nDoodle")
                    .font(Font.custom("Libra", size: 48))
                
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
                        
                        Text("START")
                            .font(Font.custom("Libra", size: 24))
                            .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.25))
                    }
                }
            }
        }
    }
    
    private func startImageAnimation() {
        Timer.scheduledTimer(withTimeInterval: 0.07, repeats: true) { timer in
            withAnimation(.easeInOut(duration: 0)) {
                currentIndex = (currentIndex + 1) % imageNames.count
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
