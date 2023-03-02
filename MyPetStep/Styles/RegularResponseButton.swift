//
//  RegularResponseButton.swift
//  MyPetStep
//
//  Created by JunHyuk Lim on 2/3/2023.
//

import Foundation
import SwiftUI

struct RegularResponseButton: View {
    
    var body: some View {
        Button(action: {
            
        }) {
            VStack() {
                HStack() {
                    Spacer().frame(width: 20)
                    Text("Hello There")
                        .fontWeight(Font.Weight.semibold)
                        .font(.system(size: 17.0))
                    Spacer()
                    Image(systemName: "chevron.right.2")
                        .resizable()
                        .foregroundColor(Color("PrimaryColor"))
                        .frame(width: 16, height: 16)
                    Spacer().frame(width: 20)
                }
            }
        }
        .frame(height: 50)
        .foregroundColor(Color("PrimaryColor"))
        .buttonStyle(RegularResponseButtonAnimation())
        .padding(.horizontal, 30)
    }
}
