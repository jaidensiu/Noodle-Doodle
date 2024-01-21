import SwiftUI

struct ToppingButton: View {
    let topping: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: { action() }) {
            Text(topping)
                .font(Font.body.bold())
                .padding()
                .foregroundColor(isSelected ? Color.black : Color.white)
                .background(isSelected ? Color.black : Color.gray)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(isSelected ? Color.black : Color.clear, lineWidth: 2)
                )
        }
        .padding(.horizontal, 8)
    }
}
