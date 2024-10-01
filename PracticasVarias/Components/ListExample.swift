import SwiftUI

var pokemons = [
    Pokemon(name: "Pikachu"),
    Pokemon(name: "Charmander"),
    Pokemon(name: "Charmeleon"),
    Pokemon(name: "Charizard")
]

var digimons = [
    Digimon(name: "Agumon"),
    Digimon(name: "Graymon"),
    Digimon(name: "Yagomon"),
    Digimon(name: "Yagomon"),
    Digimon(name: "Supermon"),
]

struct ListExample: View {
    var body: some View {
        /*
         List{
         ForEach(pokemons, id:\.name) { pokemon in //Ponemos un id, suponiendo que name es un valor único. El problema de esta forma es que si la propiedad name ser repite, puede dar problemas
         Text(pokemon.name)
         }
         }
         */
        
        /*
         List(digimons){ digimon in
         Text(digimon.name)
         }
         */
        
        List{
            Section(header: Text("Digimons")){
                ForEach(digimons) { digimon in
                    Text(digimon.name)
                }
            }
        }.listStyle(.inset) //Hay muchos estilos, es mejor investigar por mi cuenta
    }
}

struct Pokemon{
    let name:String
}

struct Digimon: Identifiable{ //Optimiza la id como tiene que hacerlo
    var id = UUID()
    let name:String
}

#Preview {
    ListExample()
}
