import SwiftUI

struct StartView: View {
    let imageNames = ["Noodle1", "Noodle2", "Noodle3"]
    @State private var currentIndex = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Noodle\nDoodle")
                    .font(Font.custom("LibraMoon-Regular", size: 32))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.25))
                
                Image(imageNames[currentIndex])
                    .resizable()
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: 200, height: 200)
                    .alignmentGuide(.leading) { d in d[.leading] }
                    .alignmentGuide(.top) { d in d[.top] }
                    .onAppear { startImageAnimation() }
                    .padding()

                NavigationLink(destination: MainView()) {
                    VStack(alignment: .leading, spacing: 192) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 89, height: 27)
                                .background(Color(red: 0.77, green: 0.88, blue: 0.9))
                                .cornerRadius(200)
                            
                            Text("START")
                                .font(Font.custom("LibraMoon-Regular", size: 18))
                                .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.25))
                        }
                    }
                    .padding(.horizontal, 40)
                    .padding(.vertical, 20)
                    .cornerRadius(23)
                    .padding(.top, 50)
                    .padding(.bottom, 60)
                }
            }
        }
    }
    
    private func startImageAnimation() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            withAnimation {
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
