import SwiftUI
import MapKit

struct MapExample: View {
    
    @State var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 28.47658, longitude: -16.336624),
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1) //Lo lejos que esta la latitud - longitud
        ))
    
    var body: some View {
        
        ZStack{
            MapReader{ proxy in
                Map(position: $position){
              //      Marker("Pollito frito" , coordinate: CLLocationCoordinate2D(latitude: 28.47658, longitude: -16.336624))
                    
                    Annotation("Pollito Frito", coordinate: CLLocationCoordinate2D(latitude: 28.47658, longitude: -16.336624)){
                        Circle().frame(height: 30)
                    }.annotationTitles(.visible)
                }
                //   .mapStyle(.hybrid)
                //   .mapStyle(.imagery)
                //   .mapStyle(.standard)
                
                    .mapStyle(.hybrid(elevation: .realistic, showsTraffic: true))
                    .onMapCameraChange(frequency: .continuous) { context in
                        print("Estamos en: \(context.region)")
                    }
                    .onTapGesture { coor in
                        if let coordinates = proxy.convert(coor, from: .local){
                            withAnimation{
                                position = MapCameraPosition.region(
                                    MKCoordinateRegion(
                                        center: CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude),
                                        span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001) //Lo lejos que esta la latitud - longitud
                                    ))
                            }
                    }
                        
                    }
            }
            VStack{
                Spacer()
                HStack{
                    Button("Ir a mi casa"){
                        withAnimation{
                            position = MapCameraPosition.region(
                                MKCoordinateRegion(
                                    center: CLLocationCoordinate2D(latitude: 43.0080962, longitude: -7.5580272),
                                    span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001) //Lo lejos que esta la latitud - longitud
                                ))
                        }
                    }.padding(10).background(.white)
                    Button("Ir a Accenture Coruña"){
                        withAnimation{
                            position = MapCameraPosition.region(
                                MKCoordinateRegion(
                                    center: CLLocationCoordinate2D(latitude: 43.3682605, longitude: -8.4057172),
                                    span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001) //Lo lejos que esta la latitud - longitud
                                ))
                        }
                    }.padding(10).background(.white).padding()
                }
            }
        }
    }
}


#Preview {
    MapExample()
}
