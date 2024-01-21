import SwiftUI

struct ButtonTitle: View {
    private var buttons: [String]
    @State private var selectedButton: String

    init(defaultTitle: String, buttons: [String]) {
        self.buttons = buttons
        self._selectedButton = State(initialValue: defaultTitle)
    }

    var body: some View {
        Text(selectedButton)
            .padding()
        
        HStack {
            ForEach(buttons, id: \.self) { button in
                Button(action: { self.selectedButton = button }) {
                    Text(button)
                        .padding()
                        .cornerRadius(8)
                        .foregroundColor(.white)
                        .background(self.buttonColor(for: button))
                }
            }
        }
    }
    
    private func buttonColor(for title: String) -> Color {
        switch title {
        case "Don't hurt me":
            return Color.blue
        case "Try me":
            return Color.green
        case "Kill me":
            return Color.red
        default:
            return Color.gray
        }
    }
}
