import SwiftUI

//Componente personalizado
struct ProductListCell: View {
    
    let product: Product
    var body: some View {
        HStack{
            ProductRemoteImage(urlString: product.image)
            // Image("default-image").resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:50, height: 50, alignment: .center)
            VStack(alignment: .leading){
                Text(product.title)
                    .font(.callout)
                    .fontWeight(.medium)
                    .padding(.bottom, 10)
               
                Text("\(product.price, specifier: "%.2f")€")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
            Spacer()
        }
        .padding() // Espaciado interno de la celda
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 2)
    }
}

#Preview {
    Home()
    // ProductListCell(product: MockData.sampleProduct)
}
