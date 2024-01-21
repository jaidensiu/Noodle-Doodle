import SwiftUI

struct SpiceLevelButtons: View {
    var level: String
    var color: Color
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(level)
                .font(Font.custom("Libra", size: 18))
                .foregroundColor(isSelected ? Color(red: 0.25, green: 0.25, blue: 0.25) : Color.white)
                .frame(width: 90, height: 60)
                .background(color)
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(isSelected ? Color(red: 0.25, green: 0.25, blue: 0.25) : Color.clear, lineWidth: 2)
                )
        }
    }
}
