//
//  CustomSearchBar.swift
//  MovieBooking
//
//  Created by Willie Yam on 2022-08-18.
//

import SwiftUI

struct CustomSearchBar: View {
    @State var searchText = ""
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Search", text: $searchText)
            Image(systemName: "mic.fill")
        }
        .padding(EdgeInsets(top: 7.0, leading: 8.0, bottom: 7.0, trailing: 8.0))
        .font(.headline)
        .background(.ultraThinMaterial)
        .foregroundColor(.white.opacity(0.6))
        .clipShape(
            RoundedRectangle(cornerRadius: 10.0, style: .continuous)
        )
    }
}

struct CustomSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomSearchBar()
    }
}
