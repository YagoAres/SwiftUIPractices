import Foundation

struct Product: Decodable, Identifiable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rating // Campo para almacenar la calificación
}

struct Rating: Decodable {
    let rate: Double
    let count: Int
}

//Datos de prueba para ver como se ve en la interfaz (ahora mismo sin uso)
struct MockData {
    static let sampleProduct = Product(
        id: 1,
        title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
        price: 9.99,
        description: "Note:The Jackets is US standard size, Please choose size as your usual wear Material: 100% Polyester; Detachable Liner Fabric: Warm Fleece. Detachable Functional Liner: Skin Friendly, Lightweigt and Warm.Stand Collar Liner jacket, keep you warm in cold weather. Zippered Pockets: 2 Zippered Hand Pockets, 2 Zippered Pockets on Chest (enough to keep cards or keys)and 1 Hidden Pocket Inside.Zippered Hand Pockets and Hidden Pocket keep your things secure. Humanized Design: Adjustable and Detachable Hood and Adjustable cuff to prevent the wind and water,for a comfortable fit. 3 in 1 Detachable Design provide more convenience, you can separate the coat and inner as needed, or wear it together. It is suitable for different season and help you adapt to different climates",
        category: "Videojuegos",
        image: "ps5pro.jpg",
        rating: Rating(rate: 4.7, count: 123) // Agrega una instancia de Rating aquí
    )
         static let sampleProduct2 = Product(id: 2, title: "Consola de élite", price: 9.99, description: "Consola PS5 pro", category: "", image: "", rating: Rating(rate: 4.7, count: 123) )
    //     static let sampleProduct3 = Product(id: 3, title: "Consola de élite", price: 9.99, description: "Consola PS5 pro", category: "", image: "")
    //     static let sampleProduct4 = Product(id: 4, title: "Consola de élite", price: 9.99, description: "Consola PS5 pro", category: "", image: "")
    static let products = [sampleProduct]
}

/*{
 "id": 1,
 "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
 "price": 109.95,
 "description": "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
 "category": "men's clothing",
 "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
 "rating": {
 "rate": 3.9,
 "count": 120
 }
 */

