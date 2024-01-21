import SwiftUI

struct MainView: View {
    var spiceLevels = [
        ("Lo", Color(red: 0.89, green: 0.84, blue: 0.59)),
        ("Med", Color(red: 0.89, green: 0.72, blue: 0.59)),
        ("Hi", Color(red: 0.89, green: 0.59, blue: 0.59))
    ]
    @State private var selectedSpiceLevel: String?
    @StateObject private var viewModel = NoodleViewModel()

    var body: some View {
        NavigationView {
            VStack {
                getGreetingMessage()
                
                Image(
                    selectedSpiceLevel == "Lo" ? "Noodle1" :
                    selectedSpiceLevel == "Med" ? "Noodle2" :
                    selectedSpiceLevel == "Hi" ? "Noodle3" : "Noodle0"
                )
                    .resizable()
                    .frame(width: 400, height: 400)
                
                Text("SPICE LEVEL")
                    .font(Font.custom("Libra", size: 18))
                
                HStack {
                    ForEach(spiceLevels, id: \.0) { (level, color) in
                        SpiceLevelButtons(
                            level: level,
                            color: color,
                            isSelected: selectedSpiceLevel == level,
                            action: { selectedSpiceLevel = level }
                        )
                        .padding(.horizontal, 5)
                    }
                }
                
                NavigationLink(destination: ConfirmationView()) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 160, height: 60)
                            .background(
                                selectedSpiceLevel == nil ?
                                    Color(red: 0.77, green: 0.89, blue: 0.9).opacity(0.5) :
                                    Color(red: 0.77, green: 0.88, blue: 0.9)
                            )
                            .cornerRadius(60)
                        
                        Text("ORDER")
                            .font(Font.custom("Libra", size: 24))
                            .foregroundColor(
                                selectedSpiceLevel == nil ?
                                    Color(red: 0.65, green: 0.65, blue: 0.65) :
                                    Color(red: 0.25, green: 0.25, blue: 0.25)
                            )
                    }
                }
                .disabled(selectedSpiceLevel == nil)
            }
            .padding(.horizontal, 20)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }

    private func getGreetingMessage() -> some View {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: Date())
        let user = "Jaiden"
        var greeting = ""

        switch hour {
            case 0..<3:
                greeting = "Late night snack,\n\(user)?"
            case 3..<12:
                greeting = "Good morning,\n\(user)!"
            case 12..<17:
                greeting = "Good afternoon,\n\(user)!"
            default:
                greeting = "Good evening,\n\(user)!"
        }

        return Text("\(greeting)")
            .font(Font.custom("Libra", size: 28))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
