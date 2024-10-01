import SwiftUI

//Para representar el rating en forma de estrella
struct RatingView: View {
    let rating: Double
    let maximumRating = 5
    let fullStar = "star.fill"
    let halfStar = "star.leadinghalf.filled"
    let emptyStar = "star"
    
    var body: some View {
        HStack {
            // Iteramos sobre los índices del 1 al máximo número de estrellas (5)
            ForEach(1...maximumRating, id: \.self) { index in
                if index <= Int(rating) {
                    // Si el índice es menor o igual al valor entero del rating, mostramos una estrella llena
                    Image(systemName: fullStar)
                        .foregroundColor(.yellow)
                } else if index == Int(rating) + 1 && rating - Double(Int(rating)) > 0 {
                    // Si el índice es justo el siguiente número entero después del rating y el rating tiene un decimal, mostramos una estrella parcialmente llena
                    Image(systemName: halfStar)
                        .foregroundColor(.yellow)
                } else {
                    // Si no, mostramos una estrella vacía
                    Image(systemName: emptyStar)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}
