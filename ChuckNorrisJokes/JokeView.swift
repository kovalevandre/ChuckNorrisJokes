//
//  ContentView.swift
//  ChuckNorrisJokes
//
//  Created by Andrey Kovalev on 20.12.2023.
//

import SwiftUI
import Observation

struct JokeView: View {
    
   @EnvironmentObject var viewModel: JokeViewModel
        
    var body: some View {
        NavigationStack {
            Text(viewModel.jokeText)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        if viewModel.isJokeExists {
                            Button {
                                viewModel.removeJoke()
                            } label: {
                                Image(systemName: "star.fill")
                            }
                        } else {
                            
                            Button {
                                viewModel.saveJoke()
                            } label: {
                                Image(systemName: "star")
                            }
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        if viewModel.isDownloading {
                            ProgressView()
                        } else {
                            
                            Button {
                                viewModel.downloadJoke()
                            } label: {
                                Image(systemName: "arrow.circlepath")
                            }
                        }
                    }
                }
        }
    }
}

#Preview {
    JokeView()
        .environmentObject(JokeViewModel())
}
