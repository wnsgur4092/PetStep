//
//  SettingsView.swift
//  MyPetStep
//
//  Created by Shuvam Shrestha on 18/2/2023.
//

import SwiftUI

struct SettingsView: View {
    @State private var schedule = Date()
    @AppStorage ("firstName") var firstName: String = ""
    @AppStorage ("lastName") var lastName: String = ""
    @AppStorage ("petName") var petName: String = ""
    @AppStorage ("stepperValue") var stepperValue: Int = 0
    @AppStorage("bond") var bondPoints = 0
    
    var body: some View {
        
        NavigationStack{
            VStack{
                Form{
                    Section(header: Text("PERSONAL INFORMATION")) {
                        VStack{
                            TextField("First Name", text: $firstName)
//                            TextField("Last Name", text: $lastName)
                        }
                    }
                    Section(header: Text("PET INFORMATION")) {
                        VStack{
                            TextField("Pet Name (One Name Only)", text: $petName)
                            Picker(selection: .constant(1), label: Text("Pet Type")) {
                                Text("Dog").tag(1)
                                Text("Cat").tag(2)
                                Text("Donkey").tag(3)
                            }
                        }
                    }
                    Section(header: Text("WALKING DETAILS")){
                        Stepper("Daily Walk Goal: \(stepperValue)", value: $stepperValue, in: 0...20000, step: 1000)
                        DatePicker("Schedule Walk", selection: $schedule, in: ...Date(), displayedComponents: .hourAndMinute)
                    }
                    Section(header: Text("Display Options")) {
                        DarkMode()
//                        Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
//                            Text("Dark Mode")
//                        }
                    }
                    Section{
                        Button(action: {
                            bondPoints = 0
                        }, label: {
                            
                            Text("Reset Progress").foregroundColor(.red)
                          
                        }
                            )
                    }
                    Section{
                    
                        Text("ABOUT PETSTEP")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                        
                    }
                    
                }
            }
            .navigationBarTitle("Settings", displayMode: .large)
            }
        }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

struct DarkMode: View {
    @State var darkMode: Bool = false

    var body: some View {
        VStack {
            Toggle("Dark Mode", isOn: $darkMode)
                .onTapGesture(count: 1, perform: {
                    darkMode.toggle()
                })
                .toggleStyle(SwitchToggleStyle(tint: Color("Color")))
        }
        .preferredColorScheme(darkMode ? .dark : .light)
    }
}
