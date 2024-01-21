import SwiftUI

struct ConfirmationView: View {
    
    var body: some View {
        Text("Jaiden’s Noodle Order")
          .font(
            Font.custom("Manrope", size: 18)
              .weight(.medium)
          )
          .multilineTextAlignment(.center)
          .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.25))
    }
}
