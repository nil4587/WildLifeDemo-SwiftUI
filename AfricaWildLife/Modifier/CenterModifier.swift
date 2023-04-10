//
//  CenterModifier.swift
//  AfricaWildLife
//
//  Created by Nileshkumar M. Prajapati on 08/08/22.
//

import Foundation
import SwiftUI

struct CenterModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
