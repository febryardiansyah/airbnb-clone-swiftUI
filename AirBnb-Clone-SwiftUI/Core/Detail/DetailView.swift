//
//  DetailView.swift
//  AirBnb-Clone-SwiftUI
//
//  Created by Febry Ardiansyah on 05/05/24.
//

import SwiftUI
import MapKit

struct DetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            // carousel
            ZStack (alignment: .topLeading) {
                ImageCarouselView()
                    .frame(height: 320)
                
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background(content: {
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        })
                        .padding(32)
                })
            }
            
            // title
            VStack(alignment: .leading, spacing: 8){
                Text("Miami Villa")
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack (alignment: .leading) {
                    HStack {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 16,height: 16)
                        
                        Text("4.36")
                        
                        Text("28 reviews")
                            .underline()
                            .fontWeight(.semibold)
                        
                    }
                    Text("Miami, Florida")
                    
                }
                .font(.caption)
            }
            
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .padding()
            
            Divider()
            
            // info view
            HStack {
                VStack (alignment: .leading, spacing: 4) {
                    Text("Entire villa hosted by John Smith")
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)
                    Text("4 guests - 4 bedrooms - 4 beds - 3 baths")
                        .font(.caption)
                }
                .frame(width: 300, alignment: .leading)
                Spacer()
                AsyncImage(url: URL(string: "https://lh3.googleusercontent.com/a/ACg8ocKBnWP5Bzh2jwVHvbCTIuIBvm7_iYClJ-Zi1k-1t8KhAL4bk5AJ=s288-c-no"))
                { phase in
                    if let image = phase.image {
                            image
                              .resizable()
                              .scaledToFill()
                              .clipShape(Circle())
                              .frame(width: 64,height: 64)
                          } else if phase.error != nil {
                            Text("Error loading image")
                          } else {
                            ProgressView()
                          }
                }
            }
            .padding()
            
            Divider()
            
            // rules
            VStack (spacing: 16) {
                ForEach(0..<2){ item in
                    HStack (spacing: 12) {
                        Image(systemName: "door.right.hand.open")
                        VStack (alignment: .leading) {
                            Text("Self check-in")
                                .font(.headline)
                            Text("Check yourself")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .padding(.vertical)
            
            Divider()
            
            // bedrooms view
            VStack (alignment: .leading, spacing: 16) {
                Text("Where you will sleep")
                    .font(.headline)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(1 ..< 5){ bedroom in
                            VStack (alignment: .leading, spacing: 8) {
                                Image(systemName: "bed.double")
                                Text("Bedroom \(bedroom)")
                            }
                            .frame(width: 132, height: 100)
                            .overlay(content: {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.gray)
                            })
                            .padding(.trailing)
                        }
                    }
                }
                .scrollTargetBehavior(.paging)
            }
            .padding()
            
            Divider()
            
            // benefit view
            VStack (alignment: .leading, spacing: 16) {
                Text("What this place offers")
                    .font(.headline)
                ForEach(0..<5) { benefit in
                    HStack (spacing: 10){
                        Image(systemName: "wifi")
                            .frame(width: 32)
                        Text("Wifi")
                            .font(.footnote)
                        Spacer()
                    }
                }
            }
            .padding()
            
            Divider()
            
            // map view
            VStack(alignment: .leading, spacing: 16) {
                Text("Where you will be")
                    .font(.headline)
                Map()
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
            
        }
        .ignoresSafeArea()
        .padding(.bottom, 72)
        .overlay(alignment: .bottom, content: {
            VStack (alignment: .leading) {
                Divider()
                    .padding(.bottom)
                
                HStack {
                    VStack (alignment: .leading) {
                        Text("$500")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Text("Total before taxes")
                            .font(.footnote)
                        Text("Oct 15 - 20")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                    }
                    
                    Spacer()
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Reserve")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                    
                }
                .padding(.horizontal)
            }
            .background(.white)
        })
    }
}

#Preview {
    DetailView()
}
