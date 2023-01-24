//
//  HomeView.swift
//  Ticket Booking
//
//  Created by Amish Tufail on 24/01/2023.
//

import SwiftUI

struct HomeView: View {
    @State var animate = false
    var body: some View {
        ZStack {
            CircleBackground(color: Color("greenCircle"))
                .blur(radius: animate ? 30.0 : 100.0)
                .offset(x: animate ? -50.0 : -130.0, y: animate ? -30.0 : -100.0)
                .task {
                    withAnimation(.easeInOut(duration: 7.0).repeatForever()) {
                        animate.toggle()
                    }
                }
            CircleBackground(color: Color("pinkCircle"))
                .blur(radius: animate ? 30 : 100.0)
                .offset(x: animate ? 100.0 : 130.0, y: animate ? 150.0 : 100.0)
            VStack(spacing: 0.0) {
                Text("Choose Movie")
                    .bold()
                    .font(.title3)
                    .foregroundColor(.white)
                CustomSearchBar()
                    .padding(EdgeInsets(top: 30.0, leading: 20.0, bottom: 20.0, trailing: 20.0))
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20.0) {
                        ScrollSection(title: "Now Playing", posters: posters1)
                        ScrollSection(title: "Coming Soon", posters: posters2)
                        ScrollSection(title: "Top Movies", posters: posters3)
                        ScrollSection(title: "Favorite", posters: posters1)
                    }
                    .padding(.bottom, 90.0)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .background(
            LinearGradient(colors: [Color("backgroundColor"), Color("backgroundColor2")], startPoint: .top, endPoint: .bottom)
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
