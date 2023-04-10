//
//  MapView.swift
//  AfricaWildLife
//
//  Created by Nileshkumar M. Prajapati on 04/08/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var region: MKCoordinateRegion = {
       let mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        let mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        let mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()
    
    let parks: [NationalPark] = Bundle.main.decode("locations.json")
    
    var body: some View {
        // 1. Simple MAP
        //Map(coordinateRegion: $region)
        
        // 1. Advanced MAP
        Map(coordinateRegion: $region, annotationItems: parks) { item in
            // A. PIN OLD STYLE (ALWAYS STATIC)
            //MapPin(coordinate: item.location, tint: .accentColor)
            
            // B. Marker New Style (Always Static)
            //MapMarker(coordinate: item.location, tint: .accentColor)
            
            // C. Custom Basic Annotation
            //                MapAnnotation(coordinate: item.location) {
            //                    Image("logo")
            //                        .resizable()
            //                        .scaledToFit()
            //                        .frame(width: 32, height: 32)
            //                }
            
            // D. Complex Map Annoation
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        } //: MapView
        .overlay(
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Lattitude: ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    Divider()
                    HStack {
                        Text("Longitude: ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                }
            }//: HSTACK
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(
                    Color.black
                        .cornerRadius(8)
                        .opacity(0.6)
                )
                .padding()
            ,alignment: .top
        ) //: Overlay
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MapView()
            MapView()
        }
    }
}
