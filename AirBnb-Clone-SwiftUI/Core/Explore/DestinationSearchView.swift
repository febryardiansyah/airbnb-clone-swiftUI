//
//  DestinationSearchView.swift
//  AirBnb-Clone-SwiftUI
//
//  Created by Febry Ardiansyah on 12/05/24.
//

import SwiftUI

enum DestinationSearchOptions {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    @Binding var show: Bool
    @State private var destination = ""
    @State private var selectedSearchOption: DestinationSearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numGuests = 0
    
    var body: some View {
        // close button
        VStack () {
            HStack {
                Button(action: {
                    withAnimation(.snappy, {
                        show.toggle()
                    })
                }, label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                })
                
                Spacer()
                
                if !destination.isEmpty {
                    Button(action: {
                        destination = ""
                    }, label: {
                        Text("Clear")
                    })
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
            .padding()
            
            // search bar
            VStack (alignment: .leading) {
                if selectedSearchOption == .location {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        
                        TextField("Search destinations", text: $destination)
                            .font(.subheadline)
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(Color(.systemGray4))
                    }
                } else {
                    CollapsedPickerView(title: "Where to", description: "")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedSearchOption == .location ? 120: 64)
            .onTapGesture {
                withAnimation(.snappy) { selectedSearchOption = .location }
            }
            
            // date selection view
            VStack (alignment: .leading) {
                if selectedSearchOption == .dates {
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    VStack {
                        DatePicker("From", selection: $startDate, displayedComponents: .date)
                        Divider()
                        DatePicker("To", selection: $endDate, displayedComponents: .date)
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                } else {
                    CollapsedPickerView(title: "When", description: "Add dates")
                    
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedSearchOption == .dates ? 180: 64)
            .onTapGesture {
                withAnimation(.snappy) { selectedSearchOption = .dates }
            }
            
            // num guest view
            VStack (alignment: .leading) {
                if selectedSearchOption == .guests {
                    VStack {
                        Text("Who's coming")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(.semibold)
                    }
                    
                    Stepper(label: {
                        Text("\(numGuests) Adults")
                    }, onIncrement: {
                        numGuests += 1
                    }, onDecrement: {
                        guard numGuests > 0 else { return }
                        numGuests -= 1
                    })
                } else {
                    CollapsedPickerView(title: "Who", description: "Add guests")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedSearchOption == .guests ? 120: 64)
            .onTapGesture {
                withAnimation(.snappy) { selectedSearchOption = .guests }
            }
            
            Spacer()
        }
    }
}

#Preview {
    DestinationSearchView(show: .constant(false))
}

struct CollapsibleDestinationViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
}

struct CollapsedPickerView: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            HStack {
                Text("\(title)")
                    .foregroundStyle(.gray)
                Spacer()
                Text("\(description)")
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
    }
}
