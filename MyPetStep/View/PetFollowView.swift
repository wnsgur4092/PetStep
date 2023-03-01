//
//  PetFollowView.swift
//  MyPetStep
//
//  Created by Shuvam Shrestha on 22/2/2023.
//

import SwiftUI

struct PetFollowView: View {
    var PetMessage: String
    
    var body: some View {
        ZStack{
            VStack{
                HStack(){
                    Spacer().frame(width: 22)
                    Text(PetMessage)
                        .frame(width: 293, height: .infinity, alignment: .leading)
                        .font(.system(size: 20))
                        .fontWeight(Font.Weight.bold)
                        .foregroundColor(Color("PrimaryColor"))
                        .lineSpacing(7)
                    
                    Spacer().frame(width: 22)
                }
                Spacer().frame(height: 16)
                HStack{
                    Spacer().frame(width: 22)
                    Image(systemName: "clock")
                        .resizable()
                        .foregroundColor(Color("MessageTimeStamp"))
                        .frame(width: 13, height: 13)
                    Spacer().frame(width: 7)
                    Text(getTime())
                        .font(.system(size: 14.0))
                        .fontWeight(Font.Weight.regular)
                        .foregroundColor(Color("MessageTimeStamp"))
                    Spacer()
                }
            }
            
            
            .padding(.top, 17)
            .padding(.bottom, 17)
            .background(.white)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color("MessageBorder"), lineWidth: 2)
            )
            
            .cornerRadius(16)
            .padding(.horizontal, 30)
            
        }.padding(.bottom, 15).padding(.top, -15)
    }
    func getTime() -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let dateString = formatter.string(from: Date())
        return dateString
    }
}

struct PetFollowView_Previews: PreviewProvider {
    static var previews: some View {
        PetFollowView(PetMessage: "Hello")
    }
}
