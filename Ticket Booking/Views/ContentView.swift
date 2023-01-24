//
//  ContentView.swift
//  Ticket Booking
//
//  Created by Amish Tufail on 24/01/2023.
//

import SwiftUI

struct ContentView: View {
    @State var currentTab: Tab = .home
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        NavigationView {
            VStack(spacing: 0.0) {
                TabView(selection: $currentTab) {
                   HomeView()
                        .tag(Tab.home)
                    Text("Location")
                        .tag(Tab.location)
                    TicketView()
                        .tag(Tab.ticket)
                    Text("Category")
                        .tag(Tab.category)
                    Text("Profile")
                        .tag(Tab.profile)
                }
                CustomTabBar(currentTab: $currentTab)
            }
            .ignoresSafeArea(.keyboard)
        } // This makes sure Tab Bar is not going up when keyboard is out
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
