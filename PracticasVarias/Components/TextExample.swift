import SwiftUI

struct TextExample: View {
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).font(.headline)
            Text("Custom").font(.system(size:40, weight: .bold, design:.monospaced))
                .underline()
                .foregroundColor(.blue)
                .background(.red)
            
            Text("Hola Hola Hola Hola")
                .frame(width: 50) //Como no caben de ancho lo pone línea a línea
                .lineLimit(3) //Límite de líneas
                .lineSpacing(10.0) //Espacio ente líneas
        }
    }
}

#Preview {
    TextExample()
}
