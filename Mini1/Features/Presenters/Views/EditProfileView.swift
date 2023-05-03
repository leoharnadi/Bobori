//
//  EditProfileView.swift
//  Mini1
//
//  Created by Nadya Tyandra on 23/04/23.
//

import SwiftUI

struct EditProfileView: View {
    @StateObject var EKManager: EventKitManager = EventKitManager()
    
    @Binding var showProfile: Bool
    
    @Binding var name: String
    @Binding var time: Date
    
    var body: some View {
        ZStack {
            Color("paleBlue").ignoresSafeArea()
            VStack {
                Image(systemName: "person.circle")
                    .font(.system(size: 80))
                    .padding()
                VStack{
                    Text("Name")
                        .font(.system(size: 21))
                        .foregroundColor(.white)
                        .padding(.leading, -150)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .frame(width: 305, height: 45)
                        
                        .overlay(
                            TextField("", text: $name)
                                .font(.system(size: 18))
                                .foregroundColor(.black)
                                .padding(.leading)
                        )
                    
                    Text("Sleeping Time")
                        .font(.system(size: 21))
                        .foregroundColor(.white)
                        .padding(.leading, -150)
                        .padding(.top, 50)
                    
                    DatePicker("Sleeping Time", selection: $time, displayedComponents: .hourAndMinute)
                        .datePickerStyle(WheelDatePickerStyle())
                        .labelsHidden()
                        .frame(width: 299, height: 210)
                        .background(Color.white)
                        .cornerRadius(20)
                        
                    
                    
                    Spacer()
                    
                    Button(action:  {
                        withAnimation() {
                            EKManager.editReminder(hour: Calendar.current.component(.hour, from: time), minute: Calendar.current.component(.minute, from: time))
                            
                            showProfile = false
                        }
                    }, label: {
                        Text("Save")
                            .font(.system(size: 21))
                            .foregroundColor(Color("paleBlue"))
                            .frame(width: 210, height: 55)
                            .background(Color.white)
                            .cornerRadius(70)
                            .padding(.top)
                            .padding(.trailing, -10)
                        
                    })
                    
                } .padding(.top, 100)
            }
        }
    }
}
