//
//  ScrollSection.swift
//  MovieBooking
//
//  Created by Willie Yam on 2022-08-18.
//

import SwiftUI

struct ScrollSection: View {
    @State var title: String = "Now Playing"
    
    @State var posters: [String] = ["poster1", "poster2", "poster3", "poster4", "poster5", "poster6"]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .padding(.horizontal, 20.0)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20.0) {
                    ForEach(posters.indices, id: \.self) { index in
                        NavigationLink {
                           BookingView()
                        } label: {
                            Image(posters[index])
                                .resizable()
                                .frame(width: 100.0, height: 130.0)
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 20.0, style: .continuous)
                                )
                        }
                    }
                }
                .offset(x: 20.0)
                .padding(.trailing, 40.0)
            }
        }
    }
}

struct ScrollSection_Previews: PreviewProvider {
    static var previews: some View {
        ScrollSection()
    }
}
