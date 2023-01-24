//
//  SeatsView.swift
//  Ticket Booking
//
//  Created by Amish Tufail on 25/01/2023.
//

import SwiftUI

struct SeatsView: View {
    @Environment(\.dismiss) var dismiss
    @State var animate: Bool = false
    @State var showButton: Bool = false
    var body: some View {
        VStack(spacing: 0.0) {
            HStack {
                CircleButton(action: {
                    dismiss()
                }, image: "arrow.left")
                Spacer()
                Text("Choose Seats")
                    .font(.title3)
                    .foregroundColor(.white)
                    .bold()
                Spacer()
                CircleButton(action: {
                    
                }, image: "calendar")
            }
            .padding(.top, 46.0)
            .padding(.horizontal, 20.0)
            Image("frontSeat")
                .padding(.top, 55.0)
                .glow(color: Color("pink"), radius: 20.0)
            Image("seats")
                .frame(height: 240.0)
                .padding(.top, 60.0)
                .padding(.horizontal, 20.0)
                .onTapGesture {
                    withAnimation(.spring()) {
                        showButton.toggle()
                    }
                }
            HStack(spacing: 20.0) {
                StatusUI()
                StatusUI(color: Color("majenta"), text: "Reserved")
                StatusUI(color: Color("cyan"), text: "Selected")
            }
            .padding(.top, 60.0)
            ZStack(alignment: .topLeading) {
                Circle()
                    .frame(width: 200.0, height: 230.0)
                    .foregroundColor(Color("purple"))
                    .blur(radius: animate ? 70.0 : 100.0)
                    .offset(x: animate ? -100.0 : 20.0, y: animate ? -20.0 : 20)
                    .task {
                        withAnimation(.easeInOut(duration: 7.0).repeatForever()) {
                            animate.toggle()
                        }
                    }
                Circle()
                    .frame(width: 200.0, height: 230.0)
                    .foregroundColor(Color("lightblue"))
                    .blur(radius: animate ? 50.0 : 100.0)
                    .offset(x: animate ? 50.0 : 70.0, y: animate ? 70.0 : 30.0)
                Circle()
                    .frame(width: 200.0, height: 230.0)
                    .foregroundColor(Color("pink"))
                    .blur(radius: animate ? 70.0 : 100.0)
                    .offset(x: animate ? 150.0 : 170.0, y: animate ? 90.0 : 100.0)
                VStack(alignment: .leading, spacing: 30.0) {
                    HStack(spacing: 10.0) {
                        Image(systemName: "calendar")
                        Text("January 25, 2023")
                        Circle()
                            .frame(width: 6.0, height: 6.0)
                        Text("6 p.m.")
                    }
                    HStack(spacing: 10.0) {
                        Image(systemName: "ticket.fill")
                        Text("VIP Section")
                        Circle()
                            .frame(width: 6.0, height: 6.0)
                        Text("Seat 9, 10")
                    }
                    HStack(spacing: 10.0) {
                        Image(systemName: "cart.fill")
                        Text("Total: Rs 2000")
                    }
                }
                .padding(42.0)
                .font(.subheadline)
                HStack {
                    Spacer()
                    RoundButton {
                        NavigationUtil.popToRootView() // From internet
                    }
                }
                .frame(maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .clipped()
            .foregroundColor(.white)
            .background(.ultraThinMaterial)
            .padding(.top, 60.0)
            .offset(y: showButton ? 0.0 : 250.0)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("backgroundColor"))
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}

struct SeatsView_Previews: PreviewProvider {
    static var previews: some View {
        SeatsView()
    }
}
