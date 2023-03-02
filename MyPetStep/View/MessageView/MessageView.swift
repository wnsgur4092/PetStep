//
//  MessageView.swift
//  MyPetStep
//
//  Created by Shuvam Shrestha on 18/2/2023.
//

import SwiftUI
import AVKit

struct MessageView: View {
    //MARK: - PROPERTIES
    @StateObject var messageViewModel : MessageViewModel = MessageViewModel()
    
    @State public var lumiEmotion: String = "LumiNeutral"
    
    //Draging and Tapping
    @State private var isDragging: Bool = false
    @State private var isPetting = false
    
    @State var bondPoints: Double = 0.0

    @State private var petLimit = 0 // -> What is this for ?
    
    //From PetConversation
    @State private var upperResponseText = "Ready as always!+10#LumiHappy"
    @State private var lowerResponseText = "Wait hold on..#LumiNeutral"
    
    
    @State var messages: [String] = ["Hey Cindy! It's 8:00am.. Ready to go for a walk?"]
    @State var IsSent = false;
    
    @State var buttonAudio: AVAudioPlayer!
    @State var receiveAudio: AVAudioPlayer!
    
    //    @Binding var lumiEmotion: String
    
    @State var isTyping = true
    
    //    @AppStorage("bond") var bondPoints = 0
    
    
    //MARK: - BODY
    var body: some View {
        VStack{
            ZStack{
                Group{
                    petRoom.offset(y: isDragging ? 0 : -350)
                    
                    coinButton
                    
                    petImage
                } //: UPSIDE GROUP
                
                ZStack{
                    Rectangle().frame(width: 400, height: 570).foregroundColor(.white).offset(y:165)
                    Group{
                        activityView.gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                            .onEnded({ value in
                                if value.translation.height < 0 {
                                    isDragging.toggle()
                                }
                                
                                if value.translation.height > 0 {
                                    isDragging.toggle()
                                }
                            }))
                        .offset(y: -120)
                        
                        petConversation
                        //                        (lumiEmotion: $lumiEmotion)
                            .padding(.top, 270)
                        Spacer()
                    } //: DOWNSIDE GROUP
                }.offset(y: isDragging ? 430 : 0)
            }.animation(.easeInOut, value: isDragging)
        }
    }
    
    //MARK: - COMPONENTS
    
    //Pet Room
    fileprivate var petRoom : some View {
        Image("PetRoom")
            .resizable()
            .edgesIgnoringSafeArea(.all)
        
    }
    
    //Pet Image
    fileprivate var petImage : some View {
        Image(isPetting ? "LumiPet" : lumiEmotion)
            .offset(
                y: isDragging ? 140 : -240).gesture(drag()).gesture(tap())
    }
    
    //COIN BUTTON
    fileprivate var coinButton : some View {
        Button(action: {
            //Do nothing : Planning to add
            
        }, label: {
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Image("coin").resizable()
                        .frame(width: 50.0, height: 50.0)
                        .offset(y: -90)
                }.padding(.horizontal, 30)
                
            }
            
        })
    }
    
    //ACTIVITY VIEW
    fileprivate var activityView : some View {
        HStack{
            HStack{
                Image(systemName: "shoeprints.fill")
                    .resizable()
                    .foregroundColor(Color("PrimaryColor"))
                    .frame(width: 14, height: 18)
                    .shadow(color: Color.gray.opacity(0.25), radius: 5)
                
                Spacer().frame(width: 8)
                
                //                Text("\(stepperValue) Left")
                Text("0 Left")
                    .font(.system(size: 15.0))
                    .fontWeight(Font.Weight.regular)
                    .foregroundColor(Color("TrackerFontColor"))
            }
            
            HStack{
                Image(systemName: "heart.fill")
                    .resizable()
                    .foregroundColor(Color("HeartColor"))
                    .frame(width: 17, height: 16)
                    .shadow(color: Color.gray.opacity(0.25), radius: 5)
                
                Spacer().frame(width: 8)
                
                //                Text(String(bondPoints))
                Text("0")
                    .font(.system(size: 15.0))
                    .fontWeight(Font.Weight.regular)
                    .foregroundColor(Color("TrackerFontColor"))
            }
            
            HStack{
                Image(systemName: "sun.max.fill")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 18, height: 18)
                    .shadow(color: Color.gray.opacity(0.25), radius: 5)
                
                Spacer().frame(width: 7)
                
                Text("24ºC")
                    .font(.system(size: 15.0))
                    .fontWeight(Font.Weight.regular)
                    .foregroundColor(Color("TrackerFontColor"))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 48)
        .background(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 50)
                .stroke(Color("MessageBorder"), lineWidth: 1)
        )
        .cornerRadius(50)
        .padding(.horizontal, 30)
    }
    
    //PET CONVERSATION
    fileprivate var petConversation : some View {
        VStack{
            ScrollView(showsIndicators: false) {
                ForEach(messages, id: \.self){ message in
                    // If the message contains [USER], that means it's us
                    if (message.contains("[USER]")) {
                        let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
                        
                        if(!newMessage.contains("unresponsive")){
                            UserMessageView(userMessage: newMessage)
                            
                            HStack{
                                Image("TypingIcon").padding(.horizontal, 30).opacity(isTyping ? 0 : 1)
                                Spacer()
                            }
                        }
                    } else {
                        if message.contains("&"){
                            let msgSplit = message.split(separator: "&")
                            
                            if(msgSplit[0].contains("_")){
                                PetFollowView(PetMessage: String(msgSplit[1]))
                            }else{
                                PetMessageView(petMessage: String(msgSplit[0]), messageViewModel: MessageViewModel()).padding(.top, -50).onAppear {
                                    
                                    self.receiveAudio.play()
                                }
                                PetFollowView(PetMessage: String(msgSplit[1]))
                            }
                        }else {
                            PetMessageView(petMessage: message, messageViewModel: MessageViewModel()).padding(.top, -50).onAppear {
                                
                                self.receiveAudio.play()
                            }
                        }
                    }
                }.rotationEffect(.degrees(180))
            }
            .rotationEffect(.degrees(180))
            
            Spacer()
            
            if(upperResponseText.contains("%moodtracker%")){
                
                Button(action: {}, label: {})
                ChooseMoodView().onTapGesture(perform: {
                    messageViewModel.moodResponse(message: "Oh that's great bruh")
                })
            } else if(!upperResponseText.contains("*") && !upperResponseText.isEmpty && upperResponseText.contains("+")){
                
                let bondSplit = upperResponseText.split(separator: "+")
                let emotionSplit = String(bondSplit[1]).split(separator: "#")
                
                Button(action: {
                    self.buttonAudio.play()
                    isTyping.toggle()
                    
                    messageViewModel.sendMessage(message: String(bondSplit[0]))
                    
                    self.lumiEmotion = String(emotionSplit[1])
                    bondPoints += Double(Int(emotionSplit[0])!)
                    messageViewModel.noResponse(message: "unresponsive")
                    
                }) {
                    VStack() {
                        HStack() {
                            Spacer().frame(width: 20)
                            Text(String(bondSplit[0]))
                                .fontWeight(Font.Weight.semibold)
                                .font(.system(size: 17.0))
                            Spacer()
                            Text("+\(String(emotionSplit[0]))")
                                .fontWeight(Font.Weight.semibold)
                            
                            Spacer().frame(width: 7)
                            Image(systemName: "heart.fill")
                                .resizable()
                                .foregroundColor(Color("HeartColor"))
                                .frame(width: 17, height: 16)
                            Spacer().frame(width: 20)
                        }
                    }
                }
                .frame(height: 50)
                .foregroundColor(.white)
                .buttonStyle(BondResponseButtonAnimation())
                .padding(.horizontal, 30)
                .opacity(IsSent ? 0 : 1)
            } else if (!upperResponseText.contains("*")) {
                
                let emotionSplit = upperResponseText.split(separator: "#")
                
                
                Button(action: {
                    self.buttonAudio.play()
                    isTyping.toggle()
                    messageViewModel.sendMessage(message: String(emotionSplit[0]))
                    self.lumiEmotion = String(emotionSplit[1])
                    
                    
                }) {
                    VStack() {
                        HStack() {
                            Spacer().frame(width: 20)
                            Text("\(String(emotionSplit[0]))")
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
                .opacity(IsSent ? 0 : 1)
            }
            
            let emotionSplit = lowerResponseText.split(separator: "#")
            
            if(!lowerResponseText.contains("*")){
                Button(action: {
                    self.buttonAudio.play()
                    isTyping.toggle()
                    messageViewModel.sendMessage(message: String(emotionSplit[0]))
                    self.lumiEmotion = String(emotionSplit[1])
                    
                }) {
                    VStack() {
                        HStack() {
                            Spacer().frame(width: 20)
                            Text("\(String(emotionSplit[0]))")
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
                .opacity(IsSent ? 0 : 1)
                .onAppear {
                    let sound = Bundle.main.path(forResource: "msgSent", ofType: "mp3")
                    self.buttonAudio = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                    
                    let receive = Bundle.main.path(forResource: "msgReceived", ofType: "mp3")
                    self.receiveAudio = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: receive!))
                    self.receiveAudio = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: receive!))
                    
                }
            }
            
        }.padding(.bottom, 10)
    }
    
    
    
    fileprivate func drag() -> some Gesture {
        DragGesture()
            .onChanged { _ in self.isPetting = true;
                bondPoints += 0.02;
                let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
                impactHeavy.impactOccurred()
                
            }
            .onEnded { _ in self.isPetting = false;
                
            }
    }
    
    fileprivate func tap() -> some Gesture {
        LongPressGesture(minimumDuration: 0)
            .onChanged { _ in self.isPetting = true;
                
                bondPoints+=0.02;
                
            }
            .onEnded { _ in self.isPetting = false;
                
                if(petLimit>=6){
                    if(isDragging){
                        isDragging.toggle()
                    }
                    
                    petLimit = 0
                }
                
                petLimit+=1
                
                UINotificationFeedbackGenerator().notificationOccurred(.error)
                let tempEmotion = lumiEmotion
                lumiEmotion = "LumiPet"
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    lumiEmotion = tempEmotion
                    
                }
            }
    }
}



//MARK: - PREVIEW
struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}

