import SwiftUI

struct BaseView: View {
    @State private var isLoading = true
    
    var body: some View {
        ZStack {
            if isLoading {
                LoadingView()
            } else {
                MainView()
            }
        }
        .onAppear {
            // Simulate some loading time (you can replace this with actual loading logic)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    self.isLoading = false
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
