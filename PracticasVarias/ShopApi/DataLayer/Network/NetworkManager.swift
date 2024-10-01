import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>() //Para la imagen
    
    static let baseURL = "https://fakestoreapi.com/"
    private let productURL = baseURL + "products"
    
    private init() {}
    
    func getProducts(completed: @escaping (Result<[Product], ProductError>) -> Void) { //Obtender el array de productos, devuelve éxito o error
        guard let url = URL(string: productURL) else {
            completed(.failure(.invalidURL))
            return
        }
        //Manejo de errores
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            //Si todo va ok... Decodificamos el Array de products
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode([Product].self, from: data)
                completed(.success(decodedResponse))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
}



