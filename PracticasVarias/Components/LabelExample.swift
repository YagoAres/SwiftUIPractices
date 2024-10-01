import SwiftUI

struct LabelExample: View {
    var body: some View {
        Label("Icono", systemImage: "sun.max.fill")
        
        Label( //Una label con un título y una imagen, y ahí luego me metes las propiedades
            title: { Text("Label") },
            icon: { Image("SwiftIcon").resizable().frame(width: 30, height:30) }
        )
    }
}

#Preview {
    LabelExample()
}
