//
//  NationalParkModel.swift
//  AfricaWildLife
//
//  Created by Nileshkumar M. Prajapati on 05/08/22.
//

import Foundation
import CoreLocation

struct NationalPark: Codable, Identifiable {
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
