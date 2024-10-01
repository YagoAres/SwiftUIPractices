import SwiftUI

struct Home: View {
    @StateObject var viewModel = ProductsListViewModel()
    @State private var productName: String = ""
    @State private var isShowingDetail = false
    @State private var selectedproduct: Product?
    
     //  @State private var products: [Product] = []
    
    // Filtramos los productos por el título
    var filteredProducts: [Product] {
        if productName.isEmpty {
            return viewModel.products
        } else {
            return viewModel.products.filter { $0.title.lowercased().contains(productName.lowercased()) }
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                TextField("", text: $productName, prompt:
                            Text("Busca el producto").font(.title2)
                    .foregroundColor(.gray))
                .font(.title2)
                .foregroundColor(.black)
                .padding(15)
                .border(.gray)
                .padding(15)
                .autocorrectionDisabled()
                .onSubmit {
                    print("Buscando: \(productName)")
                }
                .frame(maxWidth: .infinity, maxHeight: 70)
                .background(Color.white)
                .disabled(isShowingDetail) //Desactivar componente mientras de muestra la vista de detalles
                
                Spacer()
                
                NavigationView {
                    List(filteredProducts, id: \.id) { product in
                        ProductListCell(product: product).listRowSeparator(.hidden) //Sin lineas divisiorias
                            .onTapGesture {
                                selectedproduct = product
                                isShowingDetail = true
                            }
                    }.listStyle(PlainListStyle()) // Estilo sin separadores
                        .disabled(isShowingDetail)
                }
                .onAppear {
                    viewModel.getProducts()
                }.blur(radius: isShowingDetail ? 10:0)
            }
            
            if isShowingDetail {
                ProductDetailView(product: selectedproduct!, isShowingDetail: $isShowingDetail)
                    .zIndex(1)
            }
        }
            
            //Alerta personalizada
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
            }
            
        }
    }


#Preview {
    Home()
}
