//
//  FavoriteModel.swift
//  MovieDomain
//
//  Created by Dimas Wicaksono on 24/01/22.
//

public struct FavoriteModel: Equatable, Identifiable {
    public let id: Int
    public let title: String
    public let posterPath: String?
    public let overview: String
    public let popularity: Double
    public let releaseDate: String?
    public let voteAverage: Double
    public let voteCount: Int
    
    public init(
        id: Int,
        title: String,
        posterPath: String?,
        overview: String,
        popularity: Double,
        releaseDate: String?,
        voteAverage: Double,
        voteCount: Int
    ) {
        self.id = id
        self.title = title
        self.posterPath = posterPath
        self.overview = overview
        self.popularity = popularity
        self.releaseDate = releaseDate
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
}
