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
                .foregroundColor(isSelected ? .black : .white) // Adjust text color based on selection
                .padding(.horizontal, 24)
                .padding(.vertical, 16)
                .frame(width: 96, height: 48)
                .background(color)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(isSelected ? Color.black : Color.clear, lineWidth: 2) // Add border
                )
        }
    }
}

struct MainView: View {
    var spiceLevels = [
        ("Low", Color(red: 0.89, green: 0.84, blue: 0.59)),
        ("Med", Color(red: 0.89, green: 0.72, blue: 0.59)),
        ("Hi", Color(red: 0.89, green: 0.59, blue: 0.59))
    ]
    @State private var selectedSpiceLevel: String? // Track the selected spice level
    @StateObject private var viewModel = MainViewModel()
    
    var body: some View {
        VStack {
            getGreetingMessage()
            
            Image("Loading1")
                .imageScale(.small)
                .foregroundColor(.accentColor)
                .padding()
            
            Text("SPICE LEVEL")
                .padding()
                .foregroundColor(.black)
            
            HStack {
                ForEach(spiceLevels, id: \.0) { (level, color) in
                    SpiceLevelButtons(
                        level: level,
                        color: color,
                        isSelected: selectedSpiceLevel == level,
                        action: {
                            selectedSpiceLevel = level
                        }
                    )
                    .padding(.horizontal, 10)
                }
            }
            
            Button(action: { viewModel.performAPICall() }) {
                Text("Cook!")
                    .padding()
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .background(Color.black)
            }
            
            Text(viewModel.result)
                .padding()
        }
        .id(viewModel.refreshFlag)
    }
    
    private func getGreetingMessage() -> some View {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: Date())

        var greeting = ""

        switch hour {
        case 0..<12:
            greeting = "Good morning"
        case 12..<17:
            greeting = "Good afternoon"
        default:
            greeting = "Good evening"
        }

        return Text("\(greeting), Jaiden")
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
