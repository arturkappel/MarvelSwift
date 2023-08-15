//
//  OrderingHeader.swift
//  MarvelAppi
//
//  Created by Artur Kappel on 23/03/23.
//

import SwiftUI

struct OrderingHeader: View {
    @State private var selected: FilterType = .descending
    var homeViewModel = HomeViewModel.shared
    
    var body: some View {
        HStack{
            Text("Ordering by name")
                .foregroundColor(.white)
            Spacer()
            Menu{
                Picker(selection: $selected,  label: EmptyView()) {
                    ForEach(FilterType.allCases) { type in
                        Text(type.rawValue).tag(type)
                    }
                }
                .pickerStyle(.inline)
            }label: {
                Text("Change")
            }.onReceive([self.selected].publisher.first()) { value in
                homeViewModel.filterByAlphabet(order: selected)
            }
        }
        .padding(.horizontal, 24)
        .frame(width: .infinity, height: 50, alignment: .center)
        .background(){
            Color.marvelBlack
        }
    }
}

struct OrderingHeader_Previews: PreviewProvider {
    static var previews: some View {
        OrderingHeader()
    }
}
