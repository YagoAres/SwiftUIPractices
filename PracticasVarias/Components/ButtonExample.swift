import SwiftUI

struct ButtonExample: View {
    var body: some View {
        Button("Botón"){
            print("Hola")
        }
        Button(action: {print("Hola caracola")}, label:{
            Text("Botón 2")
        })
        Button(action: {print("Hola!")}, label:{
            Text("Botón 3")
                .frame(width: 100, height: 50)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(10)
        })
    }
}

struct Counter:View {
    @State var contador = 0 //Hace falta @State para acceder y modificar variables en la UI
    var body: some View {
        Button(action: {
            contador += 1
        }, label:{
            Text("Contador : \(contador)")
                .bold()
                .font(.title)
                .frame(height: 50)
                .foregroundColor(.white)
                .background(.red)
                .cornerRadius(10)
        })
    }
}

#Preview {
    Counter()
}
