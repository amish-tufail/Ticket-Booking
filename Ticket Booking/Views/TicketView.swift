//
//  TicketView.swift
//  Ticket Booking
//
//  Created by Amish Tufail on 24/01/2023.
//

import SwiftUI

struct TicketView: View {
    @State var animate = false
    var body: some View {
        ZStack {
            CircleBackground(color: Color("greenCircle"))
                .blur(radius: animate ? 30.0 : 100.0)
                .offset(x: animate ? -50.0 : -130.0, y: animate ? -30.0 : -100.0)
//                .task {
//                   
//                }
            CircleBackground(color: Color("pinkCircle"))
                .blur(radius: animate ? 30 : 100.0)
                .offset(x: animate ? 100.0 : 130.0, y: animate ? 150.0 : 100.0)
            VStack(spacing: 30.0) {
                Text("Mobile Ticket")
                    .font(.title3)
                    .foregroundColor(.white)
                    .bold()
                Text("Once you buy a movie ticket simply scan the barcode to access to your movie.")
                    .frame(maxWidth: 248)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal, 20.0)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            Tickets()
                .padding(.top, 30.0)
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 7.0).repeatForever()) {
                animate.toggle()
            }
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color("backgroundColor"), Color("backgroundColor2")]), startPoint: .top, endPoint: .bottom)
        )
    }
}

struct TicketView_Previews: PreviewProvider {
    static var previews: some View {
        TicketView()
    }
}
