//
//  ImageCarouselView.swift
//  AirBnb-Clone-SwiftUI
//
//  Created by Febry Ardiansyah on 05/05/24.
//

import SwiftUI

struct ImageCarouselView: View {
    var images: [String] = [
        "image-1",
        "image-2",
        "image-3",
        "image-4",
        "image-5",
    ]
    var body: some View {
        TabView {
            ForEach(images, id: \.self){image in
                Image(image)
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ImageCarouselView()
}
