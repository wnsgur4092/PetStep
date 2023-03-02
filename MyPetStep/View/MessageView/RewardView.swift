//
//  RewardView.swift
//  MyPetStep
//
//  Created by JunHyuk Lim on 2/3/2023.
//

import SwiftUI

struct RewardView: View {
    var body: some View {
        ZStack{
            
            Rectangle().foregroundColor(.black).edgesIgnoringSafeArea(.all)
                .opacity(0.5)
            
            VStack{
                Text("Your Rewards").font(.system(size: 14.0))
                    .fontWeight(.bold).foregroundColor(.white)
                Spacer()
            }
            VStack{
                HStack{
                    Spacer()
                    VStack{
                        Image("coin").resizable().frame(width: 60, height: 60)
                        Spacer().frame(height: 12)
                        Text("100 Bonds").foregroundColor(.white)
                            .font(.system(size: 14.0))
                            .fontWeight(.bold)
                    }
                    
                    Spacer()
                    VStack{
                        Image("coin").resizable().frame(width: 60, height: 60)
                        Spacer().frame(height: 12)
                        Text("100 Bonds").foregroundColor(.white)
                            .font(.system(size: 14.0))
                            .fontWeight(.bold)
                    }
                    Spacer()
                    VStack{
                        Image("coin").resizable().frame(width: 60, height: 60)
                        Spacer().frame(height: 12)
                        Text("300 Bonds").foregroundColor(.white)
                            .font(.system(size: 14.0))
                            .fontWeight(.bold)
                    }
                    Spacer()
                }.padding(.top, 30)
                
                HStack{
                    Spacer()
                    VStack{
                        Image("coin").resizable().frame(width: 60, height: 60)
                        Spacer().frame(height: 12)
                        Text("100 Bonds").foregroundColor(.white)
                            .font(.system(size: 14.0))
                            .fontWeight(.bold)
                    }
                    
                    Spacer()
                    VStack{
                        Image("coin").resizable().frame(width: 60, height: 60)
                        Spacer().frame(height: 12)
                        Text("100 Bonds").foregroundColor(.white)
                            .font(.system(size: 14.0))
                            .fontWeight(.bold)
                    }
                    Spacer()
                    VStack{
                        Image("coin").resizable().frame(width: 60, height: 60)
                        Spacer().frame(height: 12)
                        Text("300 Bonds").foregroundColor(.white)
                            .font(.system(size: 14.0))
                            .fontWeight(.bold)
                    }
                    Spacer()
                }.padding(.top, 30)
                HStack{
                    Spacer()
                    VStack{
                        Image("coin").resizable().frame(width: 60, height: 60)
                        Spacer().frame(height: 12)
                        Text("100 Bonds").foregroundColor(.white)
                            .font(.system(size: 14.0))
                            .fontWeight(.bold)
                    }
                    
                    Spacer()
                    VStack{
                        Image("coin").resizable().frame(width: 60, height: 60)
                        Spacer().frame(height: 12)
                        Text("100 Bonds").foregroundColor(.white)
                            .font(.system(size: 14.0))
                            .fontWeight(.bold)
                    }
                    Spacer()
                    VStack{
                        Image("coin").resizable().frame(width: 60, height: 60)
                        Spacer().frame(height: 12)
                        Text("300 Bonds").foregroundColor(.white)
                            .font(.system(size: 14.0))
                            .fontWeight(.bold)
                    }
                    Spacer()
                }.padding(.top, 30)
            }.padding(.top, 20)
            
        }
        
    }
}

struct RewardView_Previews: PreviewProvider {
    static var previews: some View {
        RewardView()
    }
}
