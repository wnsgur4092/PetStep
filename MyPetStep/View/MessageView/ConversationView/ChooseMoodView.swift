//
//  ChooseMoodView.swift
//  MyPetStep
//
//  Created by Shuvam Shrestha on 23/2/2023.
//

import SwiftUI
import Foundation

struct ChooseMoodView: View {
    // use save function in moodDiaryStorage
    @EnvironmentObject var moodDiaryStorage: MoodDiaryStorage
    
    // controls the states of btns
    @ObservedObject var viewModel = MoodViewModel()
    
    //@Binding var selectedTab: Int
    
    func delayedAddMood(delayTime: Double = 1, moodValue: Int) {
        DispatchQueue
            .main
            .asyncAfter(deadline: .now() + delayTime) {
                moodDiaryStorage.addMood(value: moodValue)
                //selectedTab = 1
            }
        
    }
    
    var body: some View {
        
        VStack {
            Text("Tap on your current mood")
                .font(.headline)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                .padding(5.0)
            .foregroundColor(Color(red: 0.482, green: 0.482, blue: 0.482))
            
            HStack(spacing: 24.0){
                // Btn1 - worst
                Button(action: {
                    viewModel.selected(selectedIndex: 0)
                    delayedAddMood(moodValue: 1)
                    
                }
                ){Image(viewModel.btn1ImageName)
                        .opacity(viewModel.isSelected[0] ? 1 : viewModel.isOtherSelected ? 0.2 : 1)
                }
                    .buttonStyle(BorderlessButtonStyle())
                
                // Btn2 - bad
                Button(action: {
                    viewModel.selected(selectedIndex: 1)
                    delayedAddMood(moodValue: 2)
                }
                ){Image(viewModel.btn2ImageName)
                        .opacity(viewModel.isSelected[1] ? 1 : viewModel.isOtherSelected ? 0.2 : 1)
                }
                    .buttonStyle(BorderlessButtonStyle())
                
                // Btn3 - Netural
                Button(action: {
                    viewModel.selected(selectedIndex: 2)
                    delayedAddMood(moodValue: 3)
                }
                ){Image(viewModel.btn3ImageName)
                        .opacity(viewModel.isSelected[2] ? 1 : viewModel.isOtherSelected ? 0.2 : 1)
                }
                    .buttonStyle(BorderlessButtonStyle())
                
                // Btn4 - good
                Button(action: {
                    viewModel.selected(selectedIndex: 3)
                    delayedAddMood(moodValue: 4)
                }
                ){Image(viewModel.btn4ImageName)
                        .opacity(viewModel.isSelected[3] ? 1 : viewModel.isOtherSelected ? 0.2 : 1)
                }
                    .buttonStyle(BorderlessButtonStyle())
                
                // Btn5 - best
                Button(action: {
                    viewModel.selected(selectedIndex: 4)
                    delayedAddMood(moodValue: 5)
                }
                ){Image(viewModel.btn5ImageName)
                        .opacity(viewModel.isSelected[4] ? 1 : viewModel.isOtherSelected ? 0.2 : 1)
                }
                    .buttonStyle(BorderlessButtonStyle())

            }
        }
    }
}

class MoodViewModel: ObservableObject {

    @Published var isOtherSelected = false
    @Published var isSelected = [false, false, false, false, false]
    @Published var btn1ImageName = "Vector-1"
    @Published var btn2ImageName = "Vector-2"
    @Published var btn3ImageName = "Vector-3"
    @Published var btn4ImageName = "Vector-4"
    @Published var btn5ImageName = "Vector-5"
    
    let delayTime = 0.6
    
    func selected(selectedIndex: Int) {
        isOtherSelected = true
        for index in 0..<5 {
            if index == selectedIndex {
                isSelected[index] = true
            } else {
                isSelected[index] = false
            }
        }
        updateImageNames()
    }
    
    func updateImageNames() {
        btn1ImageName = isSelected[0] ? "Vector-1-1" : "Vector-1"
        btn2ImageName = isSelected[1] ? "Vector-2-1" : "Vector-2"
        btn3ImageName = isSelected[2] ? "Vector-3-1" : "Vector-3"
        btn4ImageName = isSelected[3] ? "Vector-4-1" : "Vector-4"
        btn5ImageName = isSelected[4] ? "Vector-5-1" : "Vector-1"
        
//        sleep
//        DispatchQueue
//            .main
//            .asyncAfter(deadline: .now() + delayTime) {
//                print("implement function to other tab")
//            }
    }
}


//struct ChooseMoodView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChooseMoodView(selectedTab: .constant(0)).environmentObject(MoodDiaryStorage(preview: true))
//    }
//}
