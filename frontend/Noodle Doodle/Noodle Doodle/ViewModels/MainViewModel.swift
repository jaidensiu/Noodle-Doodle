import Foundation

class MainViewModel: ObservableObject {
    @Published var result: String = ""
    @Published var refreshFlag: Bool = false

    func performAPICall() {
        guard let url = URL(string: "https://google.com/") else {
            return
        }

        Task {
            do {
                let data = try await URLSession.shared.data(from: url)
                if let responseString = String(data: data.0, encoding: .utf8) {
                    print("Cooking!")
                    DispatchQueue.main.async {
//                        self.result = responseString
                        self.result = "Cooking!"
                        self.refreshFlag.toggle()
                    }
                } else {
                    print("Try again")
                    DispatchQueue.main.async {
                        self.result = "Try again"
                        self.refreshFlag.toggle()
                    }
                }
            } catch {
                print("Error: \(error)")
                DispatchQueue.main.async {
                    self.result = "Error: \(error.localizedDescription)"
                }
            }
        }
    }
}
