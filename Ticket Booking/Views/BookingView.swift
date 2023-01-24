//
//  BookingView.swift
//  Ticket Booking
//
//  Created by Amish Tufail on 24/01/2023.
//

import SwiftUI

struct BookingView: View {
    @State var gradient = [Color("backgroundColor2").opacity(0.0), Color("backgroundColor2"), Color("backgroundColor2")]
    @State var selectedDate = false
    @State var selectedHour = false
    @State var bindingSelection = false
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Image("booking")
                .resizable()
                .scaledToFit()
                .frame(maxHeight: .infinity, alignment: .top)
            VStack {
                LinearGradient(colors: gradient, startPoint: .top, endPoint: .bottom)
                    .frame(height: 600.0)
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            VStack(spacing: 0.0) {
                HStack {
                    CircleButton(action: {
                        dismiss()
                    }, image: "arrow.left")
                    Spacer()
                    CircleButton(action: {}, image: "ellipsis")
                }
                .padding(EdgeInsets(top: 46.0, leading: 20.0, bottom: 0.0, trailing: 20.0))
                Text("Doctor Strange")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.top, 200.0)
                Text("in the Multiverse of Madness")
                    .font(.title3)
                    .foregroundColor(.white)
                Text("Dr. Stephen Strange casts a forbidden spell that opens the doorway to the multiverse, including alternate versions of... ")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(30.0)
                Text("Select data and time")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                HStack(alignment: .top, spacing: 20.0) {
                    DateButton(weekDay: "Thu", numDay: "21", isSelected: $bindingSelection)
                        .padding(.top, 90.0)
                    DateButton(weekDay: "Fri", numDay: "22", isSelected: $bindingSelection)
                        .padding(.top, 70.0)
                    DateButton(weekDay: "Sat", numDay: "23", width: 70.0, height: 100.0, isSelected: $selectedDate) {
                        withAnimation(.spring()) {
                            selectedDate.toggle()
                        }
                    }
                    .padding(.top, 30.0)
                    DateButton(weekDay: "Sun", numDay: "24", isSelected: $bindingSelection)
                        .padding(.top, 70.0)
                    DateButton(weekDay: "Mon", numDay: "25", isSelected: $bindingSelection)
                        .padding(.top, 90.0)
                }
                HStack(alignment: .top, spacing: 20.0) {
                    TimeButton(hour: "16:00", isSelected: $bindingSelection)
                        .padding(.top, 20.0)
                    TimeButton(hour: "16:00", isSelected: $bindingSelection)
                    TimeButton(hour: "16:00", width: 70.0, height: 40.0, isSelected: $selectedHour) {
                        withAnimation(.spring()) {
                            selectedHour.toggle()
                        }
                    }
                    .padding(.top, -20.0)
                    TimeButton(hour: "16:00", isSelected: $bindingSelection)
                    TimeButton(hour: "16:00", isSelected: $bindingSelection)
                        .padding(.top, 20.0)
                }
                NavigationLink {
                    SeatsView()
                } label: {
                    LargeButton()
                        .padding(20.0)
                        .offset(y: selectedDate && selectedHour ? 0.0 : 200.0)
                }
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .background(Color("backgroundColor2"))
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView()
    }
}
