import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Noodle\nDoodle")
                    .font(Font.custom("LibraMoon-Regular", size: 25.53488))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.25))

                NavigationLink(destination: MainView()) {
                    VStack(alignment: .leading, spacing: 192) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 89, height: 27)
                                .background(Color(red: 0.77, green: 0.88, blue: 0.9))
                                .cornerRadius(200)
                            
                            Text("START")
                                .font(Font.custom("LibraMoon-Regular", size: 14))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.25))
                        }
                    }
                    .padding(.horizontal, 40)
                    .padding(.vertical, 20)
                    .background(Color.white)
                    .cornerRadius(23)
                    .padding(.top, 50)
                    .padding(.bottom, 60)
                }
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
