import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack{
            List{
                NavigationLink(destination: IMCView()){
                    Text("IMC Calculator")
                }
                NavigationLink(destination: Home()){
                    Text("API Testing/shop")
                }
                Text("App 3")
                Text("App 4")
                Text("App 5")
            }
        }
    }
}

#Preview {
    MenuView()
}
