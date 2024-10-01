
import SwiftUI

struct ProductDetailView: View {
    
    let product: Product
    @State private var isExpanded: Bool = false // Estado para manejar si el texto está expandido
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        
        ZStack{
            // Contenido principal
            VStack {
                ProductRemoteImage(urlString: product.image)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 320, height: 150, alignment: .center)
                    .padding(.top, 20) // Añadir espacio superior
                
                VStack(spacing: 10) {
                    Text(product.title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center) // Centra el texto del título
                    
                    Text(product.description)
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(5)
                        .padding(.horizontal, 20)
                        .lineLimit(isExpanded ? 4 : 4) // Limitar a 3 líneas si no está expandido
                    
                    Button(action: {
                        withAnimation {
                            isExpanded.toggle() // Cambiar el estado al hacer clic
                        }
                        
                    }) {
                        Text("Leer más")
                            .foregroundColor(.blue)
                            .font(.caption)
                    }
                    
                    RatingView(rating: product.rating.rate)
                    Text("\(product.price, specifier: "%.2f")€")
                        .font(.title3)
                        .foregroundColor(.gray) // Color verde para resaltar el precio
                        .fontWeight(.semibold)
                    Spacer()
                }
                Button(action: {
                    // Acción del botón (en este caso no hace nada)
                }) {
                    Text("Añadir al carrito")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity) // Botón toma el ancho completo
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 20)
                
                Spacer()
            }
            .frame(width: 320, height: 575)
            .background(Color.white)
            .cornerRadius(8)
            .shadow(radius: 10)
            
            
            //botón cerrar
            .overlay(Button {
                isShowingDetail = false
            } label: {
                ZStack{
                    Image(systemName: "xmark")
                        .imageScale(.medium)
                        .frame(width: 44, height: 44)
                        .padding(7)
                        .foregroundColor(.black)
                }
            }, alignment: .topTrailing)
            
            // Vista superpuesta que muestra la descripción completa
            if isExpanded {
                VStack {
                    ZStack(alignment: .topTrailing) {
                        VStack {
                            Text(product.description)
                                .font(.body)
                                .padding()
                                .multilineTextAlignment(.leading)
                                .lineSpacing(5)
                                .padding(.top, 15)
                        }
                        .frame(width: 320, height: 575)
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(radius: 10)
                        
                        // Botón "X" en la esquina superior derecha
                        Button(action: {
                            withAnimation {
                                isExpanded.toggle() // Cerrar la vista expandida
                            }
                        }) {
                            Image(systemName: "xmark")
                                .foregroundColor(.red)
                                .padding()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ProductDetailView(product: MockData.sampleProduct, isShowingDetail: .constant(true))
}
