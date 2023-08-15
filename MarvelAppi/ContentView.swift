//
//  ContentView.swift
//  MarvelAppi
//
//  Created by Artur Kappel on 22/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Home()
                .tabItem {
                    Label("Home", systemImage: "list.dash")
                }
            Favorite()
                .tabItem {
                    Label("Fav", systemImage: "list.dash")
                }
                
        }
        
        .onAppear(){
            UITabBar.appearance().barTintColor = UIColor(Color.marvelBlack)
            UITabBar.appearance().isTranslucent = true
            UITabBar.appearance().backgroundColor = UIColor(Color.marvelBlack)
            UITabBar.appearance().tintColor = .yellow
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
