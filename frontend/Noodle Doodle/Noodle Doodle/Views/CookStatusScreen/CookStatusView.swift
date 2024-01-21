import SwiftUI

struct CookStatusView: View {
    @State private var isActive: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                Text("COOK STATUS")
                    .font(Font.custom("Manrope", size: 18).weight(.medium))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.25))
                    .padding()

                Image("Noodle1")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.accentColor)
                    .frame(width: 200, height: 200)
                    .padding()

                HStack {
                    Text("SPICE LEVEL")
                        .bold()
                        .padding(.trailing, 20)

                    Text("Medium")
                }
                .padding(.top, 20)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isActive = true
                }
            }
            .background(
                NavigationLink(
                    destination: MainView(),
                    isActive: $isActive,
                    label: { EmptyView() }
                )
                .hidden() // Use .hidden() to hide the link
            )
        }
        .navigationBarHidden(true)
    }
}
