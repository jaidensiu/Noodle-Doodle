import SwiftUI

struct NoodleTextureSlider: View {
    @State private var selectedTextureIndex: Double = 0

    var textures: [String]

    var body: some View {
        VStack {
            Text("\(textures[Int(selectedTextureIndex)])")

            Slider(value: $selectedTextureIndex, in: 0...(Double(textures.count) - 1), step: 1)
                .padding(.horizontal, 20)
                .accentColor(.black)
        }
    }
}
