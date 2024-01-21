import SwiftUI

struct ConfirmationView: View {
    var body: some View {
        Text("YOUR NOODLE ORDER")
          .font(
            Font.custom("Manrope", size: 18)
              .weight(.medium)
          )
          .multilineTextAlignment(.center)
          .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.25))
        
        Image("Noodle1")
            .resizable()
            .imageScale(.small)
            .foregroundColor(.accentColor)
            .frame(width: 400, height: 400)
        
        HStack {
            Text("SPICE LEVEL")
                .padding(.trailing, 20)
                .bold()
            
            Text("Medium")
        }
        .padding(.top, 20)
        
        NavigationLink(destination: CookStatusView()) {
            VStack(alignment: .leading, spacing: 192) {
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 89, height: 27)
                        .background(Color(red: 0.77, green: 0.88, blue: 0.9))
                        .cornerRadius(200)
                    
                    Text("COOK")
                        .font(Font.custom("LibraMoon-Regular", size: 18))
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
