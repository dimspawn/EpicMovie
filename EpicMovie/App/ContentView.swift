//
//  ContentView.swift
//  EpicMovie
//
//  Created by Dimas Wicaksono on 24/01/22.
//

import SwiftUI
import NowPlaying
import MovieDomain
import Core

struct ContenView: View {
    @EnvironmentObject var nowPlayingPresenter: NowPlayingPresenter<
        Any,
        NowPlayingModel,
        Interactor<
            Any,
            [NowPlayingModel],
            GetNowPlayingRepository<
                NowPlayingLocalDataSource,
                GetNowPlayingRemoteDataSource,
                NowPlayingTransformer
            >
        >
    >
    
    let router = Router()
    
    var body: some View {
        NavigationView {
            NowPlayingView<
                FavoriteView<DetailView>,
                ProfileView,
                DetailView
            >(
                presenter: nowPlayingPresenter,
                detailRouter: { id in
                    router.makeDetailView(for: id)
                },
                profileRouter: {
                    router.makeProfileView()
                },
                favoriteRouter: {
                    router.makeFavoriteView()
                }
            )
        }
    }
}
