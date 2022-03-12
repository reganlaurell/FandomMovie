//
//  FandomMovie.swift
//  FandomMovie
//
//  Created by Regan Laurell on 2/20/22.
//

import Foundation

struct MovieInformation : Hashable, Codable {
    var id: Int
    var releaseId: Int?
    var chronologicalId: Int?
    var title: String
    var releaseYear: Int
    var ratingName: String?
    var runningTime: String?
    var phase: String?
    var overview: String?
    var status: String?
    var budget: String?
    var revenue: String?
    var releaseDate: String?
    var posterPath: String?
    
    init(jsonMovie: JsonMovie) {
        self.id = jsonMovie.movieId
        self.releaseId = jsonMovie.releaseId
        self.chronologicalId = jsonMovie.chronologicalId
        self.title = jsonMovie.title
        self.releaseYear = jsonMovie.releaseYear
        self.ratingName = jsonMovie.ratingName
        self.phase = jsonMovie.phase
    }
    
    private init(movieInfo: MovieInformation, tmdbMovie: TmdbMovie) {
        self.id = movieInfo.id
        self.releaseId = movieInfo.releaseId
        self.chronologicalId = movieInfo.chronologicalId
        self.title = movieInfo.title
        self.releaseYear = movieInfo.releaseYear
        self.ratingName = movieInfo.ratingName
        self.phase = movieInfo.phase
        
        self.posterPath = tmdbMovie.posterPath
        self.runningTime = tmdbMovie.getRuntime()
        self.overview = tmdbMovie.overview
        self.status = tmdbMovie.status
        self.budget = formatAmount(from: tmdbMovie.budget)
        self.revenue = formatAmount(from: tmdbMovie.revenue)
        self.releaseDate = formatDate(from: tmdbMovie.releaseDate)
    }
    
    
    func setTmdbMovieInfo(movieInfo: MovieInformation, tmdbMovie: TmdbMovie) -> MovieInformation {
        return MovieInformation(movieInfo: movieInfo, tmdbMovie: tmdbMovie)
    }
    
    func formatOrderId(id: Int) -> String {
        let lastDigit = String(id).suffix(1)
        var suffix = ""
        
        switch(lastDigit) {
        case "1":
            suffix = "st"
        case "2":
            suffix = "nd"
        case "3":
            suffix = "rd"
        case "0", "4", "5", "6", "7", "8", "9":
            suffix = "th"
        default:
            print("unknown number")
        }
        return "\(id)\(suffix)"
    }
    
    func showStatus(for status: String) -> Bool {
        return status != "Released"
    }
    
    private func formatAmount(from movieAmount: Int?) -> String? {
        if let amount = movieAmount, movieAmount != 0 {
            let formatter: NumberFormatter = {
                let formatter = NumberFormatter()
                formatter.numberStyle = .currency
                formatter.maximumFractionDigits = 0
                
                return formatter
            }()
            
            guard let formattedAmount = formatter.string(from: NSNumber(value: amount)) else { return nil}
            return formattedAmount
        }
        return nil
    }
    
    private func formatDate(from releaseDate: String?) -> String? {
        if let dateString = releaseDate {
            let readFormatter: DateFormatter = DateFormatter()
            readFormatter.dateFormat = "yyyy-MM-dd"
            
            if let date = readFormatter.date(from: dateString){
                let displayFormatter = DateFormatter()
                displayFormatter.dateFormat = "MMMM d, yyy"
                
                let displayDate = displayFormatter.string(from: date)
                return displayDate
            }
        }
        return nil
    }
}
