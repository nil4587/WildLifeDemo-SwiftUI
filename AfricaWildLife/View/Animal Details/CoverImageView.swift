//
//  CoverImageView.swift
//  AfricaWildLife
//
//  Created by Nileshkumar M. Prajapati on 04/08/22.
//

import SwiftUI

struct CoverImageView: View {
    // MARK: - PROPERTIES
    
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    // MARK: - BODY
    
    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }//: LOOP
        }//: TAB
        .tabViewStyle(.page)
    }
}

// MARK: - PREVIEW

struct CoverImageVIew_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.sizeThatFits)
    }
}
