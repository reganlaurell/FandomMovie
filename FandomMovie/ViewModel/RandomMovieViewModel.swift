//
//  RandomMovieViewModel.swift
//  FandomMovie
//
//  Created by Regan Laurell on 3/12/22.
//

import Foundation

class RandomMovieViewModel {
    var fandomMovieId: [String: [Int]]?
    
    init() {
        getMovieIds()
    }
    
    func getRandomMovie(for fandom: Fandom) -> Int {
        let movieIds = getFandomMovieIds(for: fandom)
        return movieIds?.randomElement() ?? -1
    }
    
    private func getFandomMovieIds(for fandom: Fandom) -> [Int]? {
        return fandomMovieId?[fandom.jsonFilePath]
    }
    
    private func getMovieIds() {
        if let url = URL(string: "https://reganlaurell.github.io/movie-data/movie-ids-by-fandom.json") {
            do {
                let data = try Data(contentsOf: url)
                self.fandomMovieId = parse(json: data)
            } catch {
                print("Data error: \(error)")
            }
        }
    }
    
    private func parse(json: Data) -> [String: [Int]] {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        do {
            let movieIds = try decoder.decode([String: [Int]].self, from: json)
            return movieIds
        } catch {
            print("Decoder error: \(error)")
            return [:]
        }
       
    }
}
