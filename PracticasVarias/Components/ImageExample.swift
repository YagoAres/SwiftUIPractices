import SwiftUI

struct ImageExample: View {
    var body: some View {
        Image("SwiftIcon")
            .resizable() //Para que se ajueste a las dimensiones
            .scaledToFill()
            .frame(width: 50, height: 50)
        Image(systemName: "figure")
            .resizable()
            .frame(width: 50, height: 70)
    }
}

#Preview {
    ImageExample()
}
