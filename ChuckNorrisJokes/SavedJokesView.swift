//
//  SavedJokes.swift
//  ChuckNorrisJokes
//
//  Created by Andrey Kovalev on 20.12.2023.
//

import SwiftUI

struct SavedJokesView: View {
   @EnvironmentObject var viewModel: JokeViewModel
    var body: some View {
        List {
            ForEach(viewModel.savedJokes, id:\.self) { joke in
                Text(joke)
            }
            .onDelete { indexSet in
                viewModel.removeJokes(at: indexSet)
            }
        }
    }
}

#Preview {
    SavedJokesView()
        .environmentObject(JokeViewModel())
}
