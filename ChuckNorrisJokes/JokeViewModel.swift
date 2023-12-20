//
//  JokeViewModel.swift
//  ChuckNorrisJokes
//
//  Created by Andrey Kovalev on 20.12.2023.
//

import Foundation

@Observable class JokeViewModel: ObservableObject {
    init() {
        load()
    }
    
    var jokeText = "Please tap refresh icon in top right angle"
    
    var savedJokes: [String] = []
    
    var isJokeExists = false
    
    var isDownloading = false
    
    func downloadJoke() {
        Task {
            isDownloading = true
            jokeText = try await NetworkService().downloadRandomJoke()
            isDownloading = false
            checkJokeExist()
        }
    }
    
    func saveJoke() {
        savedJokes.append(jokeText)
        checkJokeExist()
        save()
    }
    
    func removeJoke() {
        savedJokes.removeAll(where: {$0 == jokeText})
        checkJokeExist()
        save()
    }
    
    func removeJokes(at indexSet: IndexSet) {
        savedJokes.remove(atOffsets: indexSet)
        checkJokeExist()
        save()
    }
    
    func checkJokeExist() {
        isJokeExists = savedJokes.firstIndex(where: {$0 == jokeText}) != nil
    }
    
    private func save() {
        UserDefaults.standard.setValue(savedJokes, forKey: "savedJokesKey")
    }
    
    private func load() {
       savedJokes = UserDefaults.standard.array(forKey: "savedJokesKey") as? [String] ?? []
    }
    
}
