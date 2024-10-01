import SwiftUI

struct IMCView: View {
    
    @State var gender:Int = 0 //El que almacene el estado seleccionado
    @State var age:Int = 18
    @State var weight:Int = 75
    @State var height:Double = 150
    
    var body: some View {
        VStack{
            HStack{
                Togglebutton(text: "Hombre", imageName: "figure.australian.football", gender: 0, selectedgender: $gender)
                Togglebutton(text: "Mujer", imageName: "figure.cooldown", gender: 1, selectedgender: $gender)
            }
            HeightCalculator(selectedHeight: $height)
            HStack{
                CounterButton(text: "Edad", number: $age)
                CounterButton(text: "Peso", number: $weight)
            }
            IMCCalculateButton(userWeight: Double(weight), userHeight: height)
        }.frame(maxWidth: .infinity, maxHeight: .infinity) //Que ocupe todo el ancho y alto
            .background(.backgroundApp) //fondo
            .navigationBarBackButtonHidden() //Back button oculto
            .toolbar{ //ToolBar
                ToolbarItem(placement: .principal){
                    Text("IMC Calculator").foregroundColor(.white).bold()
                }
            }
    }
}

struct IMCCalculateButton:View {
    let userWeight:Double
    let userHeight:Double
    
    var body: some View {
        NavigationStack{
            NavigationLink(destination:{IMCResult(userWeight: userWeight, userHeight: userHeight)}){
                Text("Calcular").font(.title).bold().foregroundColor(.purple)
                    .frame(maxWidth: .infinity, maxHeight: 100).background(.backgroundComponent)
            }
        }
    }
}

//Componente personalizado (Contenedor1)
struct Togglebutton:View {
    let text:String
    let imageName:String
    let gender:Int
    @Binding var selectedgender:Int
    var body: some View {
        let color = if(gender == selectedgender){ //Para que cuando el boton esté seleccionado cambie de color
            Color.backgroundComponentSelected
        }else{
            Color.backgroundComponent
        }
        Button(action: {
            selectedgender = gender
        }) {
            VStack{
                Image(systemName: imageName).resizable().scaledToFit().frame(height: 100).foregroundColor(.white)
                InformationText(text: text)
            }.frame(maxWidth: .infinity, maxHeight: .infinity).background(color)
        }
    }
}

//Para tener el mismo color de texto
struct InformationText:View {
    let text:String
    var body: some View {
        Text(text).font(.largeTitle).bold().foregroundColor(.white)
    }
}
struct TitleText:View {
    let text:String
    var body: some View {
        Text(text).font(.title2).foregroundColor(.gray)
    }
}

//Componente personalizado (Contenedor2)
struct HeightCalculator:View {
    @Binding var selectedHeight:Double
    var body: some View {
        VStack{
            TitleText(text: "Altura")
            InformationText(text: "\(Int(selectedHeight)) cm") //Cojo el valor de selected height y lo paso a int
            Slider(value: $selectedHeight,in:100...220, step:1).accentColor(.purple).padding(.horizontal, 16) //Rango entre 100 y 220cm
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundComponent)
    }
}

struct CounterButton:View {
    let text:String
    @Binding var number:Int
    var body: some View {
        VStack{
            TitleText(text: text)
            InformationText(text: String(number)) //Lo pasamos a string porque solo quiero representarlo
            HStack{
                Button(action:{
                    if number == 0 {
                        number = 0
                    }else{
                        number -= 1
                    }
                }){
                    ZStack{
                        Circle()
                            .frame(width: 70, height: 70)
                            .foregroundColor(.purple)
                        Image(systemName: "minus")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 25, height: 25)
                    }
                }
                Button(action:{
                    if number > 99 {
                        number = 0
                    }else{
                        number += 1
                    }
                }){
                    ZStack{
                        Circle()
                            .frame(width: 70, height: 70)
                            .foregroundColor(.purple)
                        Image(systemName: "plus")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 25, height: 25)
                    }
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundComponent)
    }
}

#Preview {
    // Togglebutton(text: "Aris", imageName: "figure.australian.football", index: 0)
    IMCView()
}
