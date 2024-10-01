import SwiftUI

final class ProductsListViewModel: ObservableObject {
    @Published public var products: [Product] = []
    @Published var alertItem: AlertItem?
    
    //Básico
    /*
     func getProducts() {
     NetworkManager.shared.getProducts { result in
     DispatchQueue.main.async {
     switch result {
     case .success(let products):
     self.products = products
     case .failure(let error):
     print(error.localizedDescription)
     }
     }
     }
     }
     */
    
    //Añadiendo alertas personalizadas
    func getProducts() {
        NetworkManager.shared.getProducts { result in
            DispatchQueue.main.async { [self] in
                switch result {
                case .success(let products):
                    self.products = products
                case .failure(let error):
                    switch error {
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}

