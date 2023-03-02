////
////  ConversationView.swift
////  MyPetStep
////
////  Created by JunHyuk Lim on 2/3/2023.
////
//
//import SwiftUI
//import AVKit
//
//struct ConversationView: View {
//    
//    //    @State private var upperResponseText = "Anyone there?#LumiNeutral"
//    //    @State private var lowerResponseText = "Hello?#LumiNeutral"
//    //
//    //    @State var messages: [String] = []
//
//    //MARK: - PROPERTIES
//    @State private var upperResponseText = "Ready as always!+10#LumiHappy"
//    @State private var lowerResponseText = "Wait hold on..#LumiNeutral"
//    
//    @State var messages: [String] = ["Hey Cindy! It's 8:00am.. Ready to go for a walk?"]
//    @State var IsSent = false;
//    
//    @State var buttonAudio: AVAudioPlayer!
//    @State var receiveAudio: AVAudioPlayer!
//    
//    @Binding var lumiEmotion: String
//    
//    @State var isTyping = true
//    
//    @AppStorage("bond") var bondPoints = 0
//    
//    
//    //MARK: - BODY
//    var body: some View{
//        VStack{
//            ScrollView(showsIndicators: false) {
//                
//                
//                ForEach(messages, id: \.self) { message in
//                    // If the message contains [USER], that means it's us
//                    if (message.contains("[USER]")) {
//                        
//                        
//                        
//                        let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
//                        
//                        if(!newMessage.contains("unresponsive")){
//                            UserMessageView(UserMessage: newMessage)
//                            
//                            HStack{
//                                Image("TypingIcon").padding(.horizontal, 30).opacity(isTyping ? 0 : 1)
//                                Spacer()
//                            }
//                        }
//                        
//                        
//                        
//                        
//                    } else {
//                        
//                        if message.contains("&"){
//                            let msgSplit = message.split(separator: "&")
//                            
//                            if(msgSplit[0].contains("_")){
//                                PetFollowView(PetMessage: String(msgSplit[1]))
//                            }else{
//                                PetMessageView(PetMessage: String(msgSplit[0]), messageViewModel: MessageViewModel()).padding(.top, -50).onAppear {
//                                    
//                                    self.receiveAudio.play()
//                                    
//                                    
//                                    
//                                    
//                                }
//                                PetFollowView(PetMessage: String(msgSplit[1]))
//                            }
//                            
//                            
//                        }else {
//                            PetMessageView(PetMessage: message, messageViewModel: MessageViewModel()).padding(.top, -50).onAppear {
//                                
//                                self.receiveAudio.play()
//                                
//                                
//                            }
//                        }
//                        
//                        
//                        
//                        
//                        
//                    }
//                    
//                    
//                    
//                }.rotationEffect(.degrees(180))
//                
//                
//                
//            }
//            .rotationEffect(.degrees(180))
//            
//            
//            Spacer()
//            
//            if(upperResponseText.contains("%moodtracker%")){
//                
//                Button(action: {}, label: {})
//                ChooseMoodView().onTapGesture(perform: {
//                    moodResponse(message: "Oh that's great bruh")
//                })
//                
//                
//                
//                
//                
//            } else if(!upperResponseText.contains("*") && !upperResponseText.isEmpty && upperResponseText.contains("+")){
//                
//                let bondSplit = upperResponseText.split(separator: "+")
//                let emotionSplit = String(bondSplit[1]).split(separator: "#")
//                
//                Button(action: {
//                    self.buttonAudio.play()
//                    isTyping.toggle()
//                    
//                    sendMessage(message: String(bondSplit[0]))
//                    
//                    self.lumiEmotion = String(emotionSplit[1])
//                    bondPoints += Int(emotionSplit[0])!
//                    noResponse(message: "unresponsive")
//                    
//                }) {
//                    VStack() {
//                        HStack() {
//                            Spacer().frame(width: 20)
//                            Text(String(bondSplit[0]))
//                                .fontWeight(Font.Weight.semibold)
//                                .font(.system(size: 17.0))
//                            Spacer()
//                            Text("+\(String(emotionSplit[0]))")
//                                .fontWeight(Font.Weight.semibold)
//                            
//                            Spacer().frame(width: 7)
//                            Image(systemName: "heart.fill")
//                                .resizable()
//                                .foregroundColor(Color("HeartColor"))
//                                .frame(width: 17, height: 16)
//                            Spacer().frame(width: 20)
//                        }
//                    }
//                }
//                .frame(height: 50)
//                .foregroundColor(.white)
//                .buttonStyle(BondResponseButtonAnimation())
//                .padding(.horizontal, 30)
//                .opacity(IsSent ? 0 : 1)
//            } else if (!upperResponseText.contains("*")) {
//                
//                let emotionSplit = upperResponseText.split(separator: "#")
//                
//                
//                Button(action: {
//                    self.buttonAudio.play()
//                    isTyping.toggle()
//                    sendMessage(message: String(emotionSplit[0]))
//                    self.lumiEmotion = String(emotionSplit[1])
//                    
//                    
//                }) {
//                    VStack() {
//                        HStack() {
//                            Spacer().frame(width: 20)
//                            Text("\(String(emotionSplit[0]))")
//                                .fontWeight(Font.Weight.semibold)
//                                .font(.system(size: 17.0))
//                            Spacer()
//                            Image(systemName: "chevron.right.2")
//                                .resizable()
//                                .foregroundColor(Color("PrimaryColor"))
//                                .frame(width: 16, height: 16)
//                            Spacer().frame(width: 20)
//                        }
//                    }
//                }
//                .frame(height: 50)
//                .foregroundColor(Color("PrimaryColor"))
//                .buttonStyle(RegularResponseButtonAnimation())
//                .padding(.horizontal, 30)
//                .opacity(IsSent ? 0 : 1)
//            }
//            
//            let emotionSplit = lowerResponseText.split(separator: "#")
//            
//            if(!lowerResponseText.contains("*")){
//                Button(action: {
//                    self.buttonAudio.play()
//                    isTyping.toggle()
//                    sendMessage(message: String(emotionSplit[0]))
//                    self.lumiEmotion = String(emotionSplit[1])
//                    
//                }) {
//                    VStack() {
//                        HStack() {
//                            Spacer().frame(width: 20)
//                            Text("\(String(emotionSplit[0]))")
//                                .fontWeight(Font.Weight.semibold)
//                                .font(.system(size: 17.0))
//                            Spacer()
//                            Image(systemName: "chevron.right.2")
//                                .resizable()
//                                .foregroundColor(Color("PrimaryColor"))
//                                .frame(width: 16, height: 16)
//                            Spacer().frame(width: 20)
//                        }
//                    }
//                }
//                .frame(height: 50)
//                .foregroundColor(Color("PrimaryColor"))
//                .buttonStyle(RegularResponseButtonAnimation())
//                .padding(.horizontal, 30)
//                .opacity(IsSent ? 0 : 1)
//                .onAppear {
//                    let sound = Bundle.main.path(forResource: "msgSent", ofType: "mp3")
//                    self.buttonAudio = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
//                    
//                    let receive = Bundle.main.path(forResource: "msgReceived", ofType: "mp3")
//                    self.receiveAudio = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: receive!))
//                    self.receiveAudio = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: receive!))
//                    
//                }
//            }
//            
//        }.padding(.bottom, 10)
//        
//        
//        
//    }
//    
//    func noResponse(message: String) {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 30) {
//            sendMessage(message: message)
//        }
//    }
//    
//    func moodResponse(message: String) {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            sendMessage(message: message)
//        }
//    }
//    
//    func sendMessage(message: String) {
//        
//        IsSent.toggle()
//        withAnimation {
//            messages.append("[USER]" + message)
//            
//            
//            withAnimation{
//                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//                    isTyping.toggle()
//                }
//            }
//            
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                withAnimation {
//                    
////                    messages.append(getPetResponse(message: message))
////                    upperResponseText = getUpperResponse(message: message)
////                    lowerResponseText = getLowerResponse(message: message)
//                    
//                }
//                
//                withAnimation{
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                        IsSent.toggle()
//                        
//                    }
//                }
//            }
//            
//        }
//    }
//    
//    func getTime() -> String {
//        let formatter = DateFormatter()
//        formatter.timeStyle = .short
//        let dateString = formatter.string(from: Date())
//        return dateString
//    }
//}
//
//////MARK: - PREVIEW
////struct ConversationView_Previews: PreviewProvider {
////    static var previews: some View {
////
////        ConversationView(lumiEmotion: .constant(String(emotionSplit[1])))
////    }
////}
