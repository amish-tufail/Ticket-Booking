//
//  CustomTabBar.swift
//  Ticket Booking
//
//  Created by Amish Tufail on 24/01/2023.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var currentTab: Tab
    var backgroundColors = [Color("purple"), Color("lightBlue"), Color("pink")]
    var gradientColors = [Color("cyan"), Color("cyan").opacity(0.1), Color("cyan")]
    var body: some View {
        GeometryReader { proxy in
            let width = proxy.size.width
            HStack(spacing: 0.0) {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Button {
                        withAnimation(.easeInOut) {
                            currentTab = tab
                        }
                    } label: {
                        Image(tab.rawValue)
                            .renderingMode(.template)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .offset(y: currentTab == tab ? -17.0 : 0.0)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .background(alignment: .leading) {
                Circle()
                    .fill(.ultraThinMaterial)
                    .frame(width: 80.0, height: 80.0)
                    .shadow(color: .black.opacity(0.25), radius: 20.0, x: 0.0, y: 10.0)
                    .offset(x: indicatorOffset(width: width), y: -17.0)
                    .overlay(
                        Circle()
                            .trim(from: 0.0, to: 0.5)
                            .stroke(LinearGradient(colors: gradientColors, startPoint: .top, endPoint: .bottom), lineWidth: 2.0)
                            .rotationEffect(.degrees(135.0))
                            .frame(width: 78.0, height: 78.0)
                            .offset(x: indicatorOffset(width: width), y: -17.0)
                    )
            }
        }
        .frame(height: 24.0)
        .padding(.top, 30.0)
        .background(.ultraThinMaterial)
        .background(LinearGradient(colors: backgroundColors, startPoint: .leading, endPoint: .trailing))
    }
    func getIndex() -> Int {
        switch currentTab {
        case .home:
            return 0
        case .location:
            return 1
        case .ticket:
            return 2
        case .category:
            return 3
        case .profile:
            return 4
        }
    }
    // This is responsible for moment of circle to differnt tabs
    func indicatorOffset(width: CGFloat) -> CGFloat {
        let index = CGFloat(getIndex())
        if index == 0 {
            return 0
        }
        let buttonWidth = width / CGFloat(Tab.allCases.count)
        return index * buttonWidth
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
