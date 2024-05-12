//
//  SearchAndFilterBar.swift
//  AirBnb-Clone-SwiftUI
//
//  Created by Febry Ardiansyah on 05/05/24.
//

import SwiftUI

struct SearchAndFilterBar: View {
    var body: some View {
        HStack  (spacing: 10) {
            Image(systemName: "magnifyingglass")
            
            VStack (alignment: .leading,spacing: 2){
                Text("Miami")
                    .font(.footnote)
                    .fontWeight(.semibold)
                Text("Any Week - Any Guest")
                    .font(.caption2)
                    .foregroundStyle(.gray)
                    
            }
            
            Spacer()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundStyle(.black)
            })
            
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .overlay(content: {
            Capsule()
                .stroke(lineWidth: 0.5)
                .foregroundStyle(Color(.systemGray4))
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.4), radius: 2)
        })
        .padding()
    }
}

#Preview {
    SearchAndFilterBar()
}
