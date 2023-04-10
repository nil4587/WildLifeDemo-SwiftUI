//
//  CreditsView.swift
//  AfricaWildLife
//
//  Created by Nileshkumar M. Prajapati on 08/08/22.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            
            Text("""
            Copyright © Nileshkumar Prajapati
            All rights reserved.
            Better Apps ❤️ Less Code
            """)
            .font(.footnote)
            .multilineTextAlignment(.center)
        }//: VStack
        .padding()
        .opacity(0.4)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
