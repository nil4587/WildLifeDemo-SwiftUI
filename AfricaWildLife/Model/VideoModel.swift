//
//  VideoModel.swift
//  AfricaWildLife
//
//  Created by Nileshkumar M. Prajapati on 04/08/22.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    // Computed property
    var thumbnail: String {
        "video-\(id)"
    }
}
