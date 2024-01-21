import SwiftUI

struct ConfirmationView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Review your\nOrder")
                    .font(Font.custom("Libra", size: 28))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Image("Noodle1")
                    .resizable()
                    .frame(width: 400, height: 400)
                
                HStack {
                    Text("SPICE LEVEL")
                        .font(Font.custom("Libra", size: 18))
                        .padding(.trailing, 20)
                    
                    Text("Medium")
                }
                
                HStack {
                    NavigationLink(destination: CookStatusView()) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 160, height: 60)
                                .background(Color(red: 0.77, green: 0.88, blue: 0.9))
                                .cornerRadius(60)
                            
                            Text("COOK")
                                .font(Font.custom("Libra", size: 24))
                                .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.25))
                        }
                    }
                    
                    NavigationLink(destination: MainView()) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 160, height: 60)
                                .background(Color.white)
                                .cornerRadius(60)
                            
                            Text("CANCEL")
                                .font(Font.custom("Libra", size: 24))
                                .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.25))
                                .frame(width: 160, height: 60)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 60)
                                        .stroke(Color.black, lineWidth: 2)
                                )
                        }
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, -50)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}
