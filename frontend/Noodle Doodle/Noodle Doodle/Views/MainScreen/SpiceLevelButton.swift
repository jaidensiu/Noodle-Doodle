import SwiftUI

struct SpiceLevelButtons: View {
    var level: String
    var color: Color
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(level)
                .font(
                    Font.custom("Manrope", size: 18)
                        .weight(.medium)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(isSelected ? .black : .white)
                .padding(.horizontal, 24)
                .padding(.vertical, 16)
                .frame(width: 96, height: 48)
                .background(color)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(isSelected ? Color.black : Color.clear, lineWidth: 2)
                )
        }
    }
}
