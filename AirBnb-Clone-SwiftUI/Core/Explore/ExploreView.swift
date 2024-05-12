//
//  ExploreView.swift
//  AirBnb-Clone-SwiftUI
//
//  Created by Febry Ardiansyah on 05/05/24.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                SearchAndFilterBar()
                
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

#Preview {
    ExploreView()
}
