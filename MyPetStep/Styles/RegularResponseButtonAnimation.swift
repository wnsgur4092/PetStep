//
//  RegularResponseButtonAnimation.swift
//  MyPetStep
//
//  Created by JunHyuk Lim on 2/3/2023.
//

import Foundation
import SwiftUI

struct RegularResponseButtonAnimation: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack{
            let offset: CGFloat = 2
            
            RoundedRectangle(cornerRadius: 14)
                .foregroundColor(Color("SecondaryReplyBorder"))
                .offset(y: offset)
            
            RoundedRectangle(cornerRadius: 14)
                .foregroundColor(Color("SecondaryColor"))
                .offset(y: configuration.isPressed ? offset : 0)
            
            configuration.label
                .offset(y: configuration.isPressed ? offset : 0)
        }
        .compositingGroup()
        
    }
}
