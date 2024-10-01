import SwiftUI

//Ejemplo
struct Exercise1: View {
    var body: some View {
        VStack{ // Vertical Stack
            HStack{ //Horizontal Stack
                Rectangle().foregroundColor(.blue)
                Rectangle().foregroundColor(.orange)
                Rectangle().foregroundColor(.yellow)
            }.frame(height: 100)
            HStack{
                Rectangle().foregroundColor(.orange)
            }.frame(height: 100)
            HStack{
                Circle().foregroundColor(.green)
                Rectangle().frame(width:100)
                Circle().foregroundColor(.cyan)
            }.frame(height: 250)
            HStack{
                Rectangle().foregroundColor(.orange)
            }.frame(height: 100)
            HStack{
                Rectangle().foregroundColor(.blue)
                Rectangle().foregroundColor(.orange)
                Rectangle().foregroundColor(.yellow)
            }.frame(height: 100)
        }
        .background(.red)
    }
}

#Preview{
    Exercise1()
}

