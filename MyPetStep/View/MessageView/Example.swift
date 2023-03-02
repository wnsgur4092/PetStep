////
////  Example.swift
////  MyPetStep
////
////  Created by JunHyuk Lim on 2/3/2023.
////
//
//import SwiftUI
//
//struct Example: View {
//    var body: some View {
//        VStack{
//            ZStack{
//                Image("PetRoom")
//                    .resizable()
//                    .scaledToFill()
//                    .edgesIgnoringSafeArea(.all)
//              
//                
//                
//                Image("LumiNeutral")
//            }
//            
//            HStack{
//                HStack{
//                    Image(systemName: "shoeprints.fill")
//                        .resizable()
//                        .foregroundColor(Color("PrimaryColor"))
//                        .frame(width: 14, height: 18)
//                        .shadow(color: Color.gray.opacity(0.25), radius: 5)
//                    
//                    Spacer().frame(width: 8)
//                    
//                    //                Text("\(stepperValue) Left")
//                    Text("0 Left")
//                        .font(.system(size: 15.0))
//                        .fontWeight(Font.Weight.regular)
//                        .foregroundColor(Color("TrackerFontColor"))
//                }
//                
//                HStack{
//                    Image(systemName: "heart.fill")
//                        .resizable()
//                        .foregroundColor(Color("HeartColor"))
//                        .frame(width: 17, height: 16)
//                        .shadow(color: Color.gray.opacity(0.25), radius: 5)
//                    
//                    Spacer().frame(width: 8)
//                    
//                    //                Text(String(bondPoints))
//                    Text("0")
//                        .font(.system(size: 15.0))
//                        .fontWeight(Font.Weight.regular)
//                        .foregroundColor(Color("TrackerFontColor"))
//                }
//                
//                HStack{
//                    Image(systemName: "sun.max.fill")
//                        .renderingMode(.original)
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 18, height: 18)
//                        .shadow(color: Color.gray.opacity(0.25), radius: 5)
//                    
//                    Spacer().frame(width: 7)
//                    
//                    Text("24ºC")
//                        .font(.system(size: 15.0))
//                        .fontWeight(Font.Weight.regular)
//                        .foregroundColor(Color("TrackerFontColor"))
//                }
//            }
//            .frame(maxWidth: .infinity, maxHeight: 48)
//            .background(.white)
//            .overlay(
//                RoundedRectangle(cornerRadius: 50)
//                    .stroke(Color("MessageBorder"), lineWidth: 1)
//            )
//            .cornerRadius(50)
//            .padding(.horizontal, 30)
//            
//            
//            ZStack{
//                GeometryReader { geo in
//                    ScrollView(.vertical, showsIndicators: true) {
//                        PetMessageView(PetMessage: "Hi")
//                        PetMessageView(PetMessage: "Hi")
//                        PetMessageView(PetMessage: "Hi")
//                    }
//                    .frame(width: geo.size.width, height: geo.size.height/2)
//                }
//                
//            }
//        }
//    }
//}
//
//struct Example_Previews: PreviewProvider {
//    static var previews: some View {
//        Example()
//    }
//}
