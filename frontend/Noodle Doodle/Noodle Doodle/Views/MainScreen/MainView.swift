import SwiftUI

struct MainView: View {
    var spiceLevels = [
        ("Low", Color(red: 0.89, green: 0.84, blue: 0.59)),
        ("Med", Color(red: 0.89, green: 0.72, blue: 0.59)),
        ("Hi", Color(red: 0.89, green: 0.59, blue: 0.59))
    ]
    @State private var selectedSpiceLevel: String?
    @StateObject private var viewModel = NoodleViewModel()

    var body: some View {
        NavigationView {
            VStack {
                getGreetingMessage()
                    .padding(.top, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Image(
                    selectedSpiceLevel == "Low" ? "Noodle1" :
                    selectedSpiceLevel == "Med" ? "Noodle2" :
                    selectedSpiceLevel == "Hi" ? "Noodle3" : "Bowl"
                )
                    .resizable()
                    .imageScale(.small)
                    .foregroundColor(.accentColor)
                    .frame(width: 400, height: 400)
                
                Text("SPICE LEVEL")
                    .bold()
                
                HStack {
                    ForEach(spiceLevels, id: \.0) { (level, color) in
                        SpiceLevelButtons(
                            level: level,
                            color: color,
                            isSelected: selectedSpiceLevel == level,
                            action: { selectedSpiceLevel = level }
                        )
                        .padding(.horizontal, 10)
                    }
                }
                
                NavigationLink(destination: ConfirmationView()) {
                    VStack(alignment: .leading, spacing: 192) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 89, height: 27)
                                .background(Color(red: 0.77, green: 0.88, blue: 0.9))
                                .cornerRadius(200)
                            
                            Text("ORDER")
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
            .padding()
        }
        .navigationBarHidden(true)
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

        return Text("\(greeting), Jaiden!")
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
