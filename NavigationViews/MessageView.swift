//
//  MessageView.swift
//  MyPetStep
//
//  Created by Shuvam Shrestha on 18/2/2023.
//

import SwiftUI
import AVKit

struct MessageView: View {
    
    
    @State public var lumiEmotion: String = "LumiNeutral"
    @State private var isDragging: Bool = false
    
    @AppStorage("bond") var bondPoints: Double = 0.0
    
    @State private var isPetting = false
    
    @State private var petLimit = 0;
    
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { _ in self.isPetting = true;
                bondPoints+=0.02;
                let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
                impactHeavy.impactOccurred()
                
            }
            .onEnded { _ in self.isPetting = false;
                
            }
    }
    var tap: some Gesture {
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
    
    
    
    var body: some View {
        
        VStack{
            ZStack{
                Group{
                    PetView().offset(y: isDragging ? 0 : -350)
                    Button(action: {
                        //Do nothing
                        
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
                    
                    Image(isPetting ? "LumiPet" : lumiEmotion).offset(y: isDragging ? 140 : -240).gesture(drag).gesture(tap)
                    
                }
                ZStack{
                    Rectangle().frame(width: 400, height: 570).foregroundColor(.white).offset(y:165)
                    Group{
                        ActivityView().gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                            .onEnded({ value in
                                if value.translation.height < 0 {
                                    isDragging.toggle()
                                }
                                
                                if value.translation.height > 0 {
                                    isDragging.toggle()
                                }
                            }))
                        .offset(y: -120)
                        
                        PetConversation(lumiEmotion: $lumiEmotion)
                            .padding(.top, 270)
                        Spacer()
                    }
                }.offset(y: isDragging ? 430 : 0)
//                RewardView()
            }.animation(.easeInOut, value: isDragging)
            
            
            
            
        }
        //Image("Onion").offset(y:-9).opacity(0.4)
        
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}

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

struct ActivityView: View {
    
    @AppStorage("bond") var bondPoints = 0
    @AppStorage ("stepperValue") var stepperValue: Int = 0
    
    var body: some View {
        HStack{
            Spacer()
            Group {
                Image(systemName: "shoeprints.fill")
                    .resizable()
                    .foregroundColor(Color("PrimaryColor"))
                    .frame(width: 14, height: 18)
                    .shadow(color: Color.gray.opacity(0.25), radius: 5)
                
                Spacer().frame(width: 7)
                
                Text("\(stepperValue) Left")
                    .font(.system(size: 15.0))
                    .fontWeight(Font.Weight.regular)
                    .foregroundColor(Color("TrackerFontColor"))
            }
            Spacer()
            Group {
                Image(systemName: "heart.fill")
                    .resizable()
                    .foregroundColor(Color("HeartColor"))
                    .frame(width: 17, height: 16)
                    .shadow(color: Color.gray.opacity(0.25), radius: 5)
                
                Spacer().frame(width: 7)
                
                Text(String(bondPoints))
                    .font(.system(size: 15.0))
                    .fontWeight(Font.Weight.regular)
                    .foregroundColor(Color("TrackerFontColor"))
            }
            
            Spacer()
            
            Group {
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
            
            Spacer()
            
        }
        .frame(height: 49)
        .background(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 50)
                .stroke(Color("MessageBorder"), lineWidth: 1)
        )
        .cornerRadius(50)
        .padding(.horizontal, 30)
        Spacer()
    }
}





struct BondResponseButtonAnimation: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack{
            let offset: CGFloat = 2
            
            RoundedRectangle(cornerRadius: 14)
                .foregroundColor(Color("PrimaryReplyBorder"))
                .offset(y: offset)
            
            RoundedRectangle(cornerRadius: 14)
                .foregroundColor(Color("PrimaryColor"))
                .offset(y: configuration.isPressed ? offset : 0)
            
            configuration.label
                .offset(y: configuration.isPressed ? offset : 0)
        }
        .compositingGroup()
        
    }
}

struct MessageStartDate: View {
    var body: some View{
        // Yo
        Text(getTime()).font(.system(size: 14.0))
            .fontWeight(Font.Weight.regular)
            .foregroundColor(Color("ReplyTimeStamp"))
    }
    
    func getTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
        
        let string = dateFormatter.string(from: Date())
        
        return string
    }
}

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

struct PetConversation: View {
    
    
//    @State private var upperResponseText = "Anyone there?#LumiNeutral"
//    @State private var lowerResponseText = "Hello?#LumiNeutral"
//
//    @State var messages: [String] = []
    
    @State private var upperResponseText = "Ready as always!+10#LumiHappy"
    @State private var lowerResponseText = "Wait hold on..#LumiNeutral"
   
    @State var messages: [String] = ["Hey Cindy! It's 8:00am.. Ready to go for a walk?"]
    @State var IsSent = false;
    
    @State var buttonAudio: AVAudioPlayer!
    @State var receiveAudio: AVAudioPlayer!
    
    @Binding var lumiEmotion: String
    
    @State var isTyping = true
    
    @AppStorage("bond") var bondPoints = 0
    
    
    
    
    var body: some View{
        
        VStack{
            
            ScrollView(showsIndicators: false) {
                
                
                ForEach(messages, id: \.self) { message in
                    // If the message contains [USER], that means it's us
                    if (message.contains("[USER]")) {
                        
                        
                        
                        let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
                        
                        if(!newMessage.contains("unresponsive")){
                            UserMessageView(UserMessage: newMessage)
                            
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
                                PetMessageView(PetMessage: String(msgSplit[0])).padding(.top, -50).onAppear {
                                    
                                    self.receiveAudio.play()
                                    
                                    
                                    
                                    
                                }
                                PetFollowView(PetMessage: String(msgSplit[1]))
                            }
                            
                            
                        }else {
                            PetMessageView(PetMessage: message).padding(.top, -50).onAppear {
                                
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
                    moodResponse(message: "Oh that's great bruh")
                })
                    
                
                    
                
                
            } else if(!upperResponseText.contains("*") && !upperResponseText.isEmpty && upperResponseText.contains("+")){
                
                let bondSplit = upperResponseText.split(separator: "+")
                let emotionSplit = String(bondSplit[1]).split(separator: "#")
                
                Button(action: {
                    self.buttonAudio.play()
                    isTyping.toggle()
                    
                    sendMessage(message: String(bondSplit[0]))
                    
                    self.lumiEmotion = String(emotionSplit[1])
                    bondPoints += Int(emotionSplit[0])!
                    noResponse(message: "unresponsive")
                    
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
                    sendMessage(message: String(emotionSplit[0]))
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
                    sendMessage(message: String(emotionSplit[0]))
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
    
    func noResponse(message: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 30) {
            sendMessage(message: message)
        }
    }
    
    func moodResponse(message: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            sendMessage(message: message)
        }
    }
    
    func sendMessage(message: String) {
        
        IsSent.toggle()
        withAnimation {
            messages.append("[USER]" + message)
            
            
            withAnimation{
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    isTyping.toggle()
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    
                    messages.append(getPetResponse(message: message))
                    upperResponseText = getUpperResponse(message: message)
                    lowerResponseText = getLowerResponse(message: message)
                    
                }
                
                withAnimation{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        IsSent.toggle()
                        
                    }
                }
            }
            
        }
    }
    
    func getTime() -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let dateString = formatter.string(from: Date())
        return dateString
    }
}


struct PetView: View {
    var body: some View {
        
        Image("PetRoom")
            .resizable()
            .edgesIgnoringSafeArea(.all)
        
    }
}
