//
//  ContentView.swift
//  Stocksy
//
//  Created by Muhammet Furkan Saygıcı on 23.11.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0 // Hangi tab'ın seçili olduğunu tutacağız

    var body: some View {
        TabView(selection: $selectedTab) {
            PortfolioView() // Portfolio Tab
                .tabItem {
                    Image(systemName: selectedTab == 0 ? "chart.pie.fill" : "chart.pie")
                    Text("Portfolio")
                }
                .tag(0)
            
            DiscoverView() // Discover Tab
                .tabItem {
                    Image(systemName: selectedTab == 1 ? "safari.fill" : "safari")
                    Text("Discover")
                }
                .tag(1)
            
            ProfileView() // Profile Tab
                .tabItem {
                    Image(systemName: selectedTab == 2 ? "person.crop.circle.fill" : "person.crop.circle")
                    Text("Profile")
                }
                .tag(2)
        }
        .accentColor(Color("mainColor")) // Seçili tab'ın rengini tanımladığınız PrimaryColor ile yapıyoruz.
    }
}

struct DiscoverView: View {
    var body: some View {
        Text("Discover Tab Content")
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile Tab Content")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    ContentView()
}
