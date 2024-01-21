import SwiftUI

struct MainView: View {
    var spiceLevels = [
        ("Low", Color(red: 0.89, green: 0.84, blue: 0.59)),
        ("Med", Color(red: 0.89, green: 0.72, blue: 0.59)),
        ("Hi", Color(red: 0.89, green: 0.59, blue: 0.59))
    ]
    var noodleTextures = ["Soft", "Firm", "Al Dente"]
    @State private var selectedSpiceLevel: String?
    @State private var selectedTextureIndex: Double = 0.0
    @State private var sliderValue: Double = .zero
    @FocusState private var isConfirmationViewFocused: Bool
    @State private var isConfirmationViewPresented = false
    @StateObject private var viewModel = MainViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    getGreetingMessage()

                    Image("Noodle")
                        .resizable()
                        .imageScale(.small)
                        .foregroundColor(.accentColor)
                        .frame(width: 400, height: 400)

                    Text("SPICE LEVEL")
                        .foregroundColor(.black)

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

                    Text("NOODLE TEXTURE")
                        .foregroundColor(.black)

                    VStack {
                        Text("Approximate time to cook: \(sliderValue, specifier: "%.0f") minutes")

                        Slider(
                            value: $sliderValue,
                            in: 1...5
                        )
                    }
                    .padding()

                    Text(noodleTextures[Int(selectedTextureIndex)])
                        .foregroundColor(.black)

                    Text("TOPPINGS")
                        .foregroundColor(.black)

                    let toppings = ["Veggies", "Meat", "Chili Oil"]
                    @State var selectedToppings: Set<String> = []

                    HStack {
                        ForEach(toppings, id: \.self) { topping in
                            ToppingButton(topping: topping, isSelected: selectedToppings.contains(topping)) {
                                if selectedToppings.contains(topping) {
                                    selectedToppings.remove(topping)
                                } else {
                                    selectedToppings.insert(topping)
                                }
                            }
                        }
                    }

                    Button {
                        viewModel.performAPICall()
                        isConfirmationViewPresented = true
                    } label: {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 89, height: 27)
                                .background(Color(red: 0.77, green: 0.88, blue: 0.9))
                                .cornerRadius(200)

                            Text("COOK")
                                .font(Font.custom("LibraMoon-Regular", size: 14))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.25))
                        }
                    }
                    .focused($isConfirmationViewFocused)
                }
                .id(viewModel.refreshFlag)
                .background(
                    NavigationLink(
                        destination: ConfirmationView(),
                        isActive: $isConfirmationViewPresented
                    ) {
                        EmptyView()
                    }
                    .hidden()
                )
            }
            .navigationTitle("Main View")
        }
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
