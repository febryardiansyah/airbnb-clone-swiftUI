//
//  ItemCardVertical.swift
//  AirBnb-Clone-SwiftUI
//
//  Created by Febry Ardiansyah on 05/05/24.
//

import SwiftUI

struct ItemCardVertical: View {
    
    
    
    var body: some View {
        VStack (spacing: 8) {
            ImageCarouselView()
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            HStack (alignment: .top) {
                VStack (alignment: .leading) {
                    Text("Miami, Florida")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    
                    Text("$567 night")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                Spacer()
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 16,height: 16)
                Text("4.36")
                    .font(.system(size: 16))
            }
            .font(.footnote)
        }
        .padding()

    }
}


#Preview {
    ItemCardVertical()
}
