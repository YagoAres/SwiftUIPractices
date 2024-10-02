import SwiftUI

struct ProductRemoteImage: View {
    let urlString: String
    
    var body: some View {
        // Usamos AsyncImage para cargar la imagen desde la URL
        AsyncImage(url: URL(string: urlString)) { phase in
            if let image = phase.image {
                // La imagen se cargó correctamente
                image
                   .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:50, height: 50, alignment: .center)
                
            } else if phase.error != nil {
                // En caso de error mostramos la imagen por defecto
                Image("default-image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:50, height: 50, alignment: .center)
            } else {
                // Mientras la imagen está cargando mostramos un indicador de carga
                ProgressView()
            }
        }
        .frame(width: 100, height: 100) 
    }
}




