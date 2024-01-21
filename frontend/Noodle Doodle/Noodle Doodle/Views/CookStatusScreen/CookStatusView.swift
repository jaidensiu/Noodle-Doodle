import SwiftUI

struct CookStatusView: View {
    let imageNames = ["Cooking2.1", "Cooking2.2"]
    @State private var currentIndex = 0
    @State private var isActive: Bool = false
    @State private var isButtonEnabled: Bool = false
    @ObservedObject var viewModel = ContentViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if isButtonEnabled == false {
                    Text("Your noodles are cooking...")
                        .font(Font.custom("Libra", size: 24))
                        .padding(.top, 100)
                        .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.25))
                    
                    Image(imageNames[currentIndex])
                        .resizable()
                        .frame(width: 400, height: 400)
                        .onAppear { startImageAnimation() }
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 200, height: 60)
                            .background(Color(red: 0.77, green: 0.88, blue: 0.9).opacity(0.5))
                            .cornerRadius(60)
                        
                        Text("Cook more")
                            .font(Font.custom("Libra", size: 24))
                            .foregroundColor(Color(red: 0.65, green: 0.65, blue: 0.65))
                    }
                    .padding(.top, 10)
                } else {
                    Text("Enjoy your noodles!")
                        .font(Font.custom("Libra", size: 24))
                        .padding(.top, 100)
                        .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.25))
                    
                    Image("Noodle2")
                        .resizable()
                        .frame(width: 400, height: 400)
                    
                    NavigationLink(destination: MainView()) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 200, height: 60)
                                .background(Color(red: 0.77, green: 0.88, blue: 0.9))
                                .cornerRadius(60)
                            
                            Text("Cook more")
                                .font(Font.custom("Libra", size: 24))
                                .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.25))
                        }
                        .padding(.top, 10)
                    }
                }
                
                List(viewModel.posts) { post in
                    VStack(alignment: .leading) {
                        Text(post.title)
                            .font(.headline)
                        Text(post.body)
                            .font(.subheadline)
                    }
                }
                .onAppear(perform: viewModel.fetchPostsAndCookRamen)
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in
                isButtonEnabled = true
            }
        }
    }
    
    private func startImageAnimation() {
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
            withAnimation(.easeInOut(duration: 0)) {
                currentIndex = (currentIndex + 1) % imageNames.count
            }
        }
    }
}
