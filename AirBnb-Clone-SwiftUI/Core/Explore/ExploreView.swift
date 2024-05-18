//
//  ExploreView.swift
//  AirBnb-Clone-SwiftUI
//
//  Created by Febry Ardiansyah on 05/05/24.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView = false
    
    var body: some View {
        NavigationStack {
            if showDestinationSearchView {
                DestinationSearchView(show: $showDestinationSearchView)
            } else {
                ScrollView {
                    SearchAndFilterBar()
                        .onTapGesture {
                            withAnimation(.snappy){
                                showDestinationSearchView.toggle()
                            }
                        }
                    LazyVStack (spacing: 32) {
                        ForEach(0...10,id: \.self) { item in
                            NavigationLink(destination: DetailView().navigationBarBackButtonHidden()) {
                                ItemCardVertical()
                                    .foregroundStyle(.black)
                            }
                        }
                    }
                }
            }
            
        }
    }
}

#Preview {
    ExploreView()
}
