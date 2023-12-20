//
//  MainTabView.swift
//  ChuckNorrisJokes
//
//  Created by Andrey Kovalev on 20.12.2023.
//

import SwiftUI

struct MainTabView: View {
    
    var body: some View {
        TabView {
            JokeView()
                .tabItem {
                    Label("Random joke", systemImage: "person.circle")
                }
            SavedJokesView()
                .tabItem {
                    Label("Saved joke", systemImage: "list.dash")
                }
        }
        .environmentObject(JokeViewModel())
    }
}

#Preview {
    MainTabView()
}
