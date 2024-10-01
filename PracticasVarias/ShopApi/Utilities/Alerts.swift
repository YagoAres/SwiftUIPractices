import SwiftUI


struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
  //Alertas
    
    static let invalidData = AlertItem(title: Text("Error del servidor"),
                                            message: Text("Los datos recibidos del servidor no eran válidos. Por favor contacte al soporte."),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(title: Text("Error del servidor"),
                                            message: Text("Respuesta no válida del servidor. Inténtelo de nuevo más tarde o comuníquese con el soporte."),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidURL = AlertItem(title: Text("Error del servidor"),
                                            message: Text("Hubo un problema al conectarse al servidor. Si esto persiste, comuníquese con el soporte."),
                                            dismissButton: .default(Text("OK")))
    
    static let unableToComplete = AlertItem(title: Text("Error del servidor"),
                                            message: Text("No se puede completar su solicitud en este momento. Por favor verifique su conexión a Internet."),
                                            dismissButton: .default(Text("OK")))
}
