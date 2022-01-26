//
//  FavoriteTransformer.swift
//  Favorite
//
//  Created by Dimas Wicaksono on 25/01/22.
//

import Core
import MovieDomain

public struct FavoriteTransformer: Mapper {
    public typealias Response = Any
    public typealias Entity = FavoriteEntity
    public typealias Domain = DetailModel
    
    public init(){}
    
    public func tranformReponseToEntity(response: Any) -> FavoriteEntity {
        fatalError()
    }
    
    public func tranformEntityToDomain(entity: FavoriteEntity) -> DetailModel {
        fatalError()
    }
    
    public func tranformResponseToDomain(response: Any) -> DetailModel {
        fatalError()
    }
    
    public func tranformDomainToEntity(domain: DetailModel) -> FavoriteEntity {
        let favorite = FavoriteEntity()
        favorite.id = domain.id
        favorite.title = domain.title
        favorite.posterPath = domain.posterPath ?? ""
        favorite.overview = domain.overview
        favorite.popularity = domain.popularity
        favorite.releaseDate = domain.releaseDate
        favorite.voteAverage = domain.voteAverage
        favorite.voteCount = domain.voteCount
        return favorite
    }
}
