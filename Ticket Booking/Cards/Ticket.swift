//
//  Ticket.swift
//  Ticket Booking
//
//  Created by Amish Tufail on 24/01/2023.
//

import SwiftUI

struct Ticket: View {
    @State var title = "Thor"
    @State var subtitle = "Love and Thunder"
    @State var top = "thor-top"
    @State var bottom = "thor-bottom"
    @Binding var height: CGFloat // To create the card animation
    var gradient = [Color("cyan"), Color("cyan").opacity(0.0), Color("cyan").opacity(0.0)]
    var body: some View {
        VStack(spacing: 0.0) {
            VStack(spacing: 4.0) {
                Text(title)
                    .bold()
                Text(subtitle)
            }
            .padding(EdgeInsets(top: 20.0, leading: 30.0, bottom: 0.0, trailing: 30.0))
            .frame(width: 250.0, height: 325.0, alignment: .top)
            .foregroundColor(.white)
            .background(
                Image(top)
                    .resizable()
                    .scaledToFill()
            )
            .mask {
                Image(top)
                    .resizable()
                    .scaledToFill()
            }
            .overlay {
                RoundedRectangle(cornerRadius: 40.0, style: .continuous)
                    .stroke(LinearGradient(colors: gradient, startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.0)
            }
            .cornerRadius(40.0, corners: [.topLeft, .topRight])
            Spacer(minLength: height)
            VStack(spacing: 10.0) {
                Line()
                    .stroke(style: StrokeStyle(lineWidth: 2.0, dash: [7]))
                    .frame(width: 200.0, height: 1.0)
                    .opacity(0.6)
                HStack(spacing: 20.0) {
                    HStack(spacing: 4.0) {
                        Text("Date:")
                            .fontWeight(.medium)
                            .foregroundColor(Color("lightPurple"))
                        Text("April 23")
                            .foregroundColor(.black)
                    }
                    HStack(spacing: 4.0) {
                        Text("Time:")
                            .fontWeight(.medium)
                            .foregroundColor(Color("lightPurple"))
                        Text("6 p.m.")
                            .foregroundColor(.black)
                    }
                }
                HStack(spacing: 20.0) {
                    HStack(spacing: 4.0) {
                        Text("Row:")
                            .fontWeight(.medium)
                            .foregroundColor(Color("lightPurple"))
                        Text("2")
                            .foregroundColor(.black)
                    }
                    HStack(spacing: 4.0) {
                        Text("Seats")
                            .fontWeight(.medium)
                            .foregroundColor(Color("lightPurple"))
                        Text("9, 10")
                            .foregroundColor(.black)
                    }
                }
                Image("code")
            }
            .frame(width: 250.0, height: 135.0, alignment: .top)
            .background(.ultraThinMaterial)
            .background(
                Image(bottom)
                    .resizable()
                    .scaledToFill()
                
            )
            .mask(
                Image(bottom)
                    .resizable()
                    .scaledToFill()
            )
        }
        .frame(height: 460.0)
        .font(.footnote)
        .shadow(radius: 10.0)
    }
}

struct Ticket_Previews: PreviewProvider {
    static var previews: some View {
        Ticket(height: .constant(0.0))
    }
}
