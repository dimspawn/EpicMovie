//
//  SceneDelegate.swift
//  EpicMovie
//
//  Created by Dimas Wicaksono on 24/01/22.
//

import UIKit
import Core
import NowPlaying
import MovieDomain
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        let getNowPlayingUseCase: Interactor<
            Any,
            [NowPlayingModel],
            GetNowPlayingRepository<
                NowPlayingLocalDataSource,
                GetNowPlayingRemoteDataSource,
                NowPlayingTransformer
            >
        > = Injection.init().provideNowPlaying()
        let nowPlatingPresenter = NowPlayingPresenter(getNowPlayingUseCase: getNowPlayingUseCase)
        let contentView = ContenView().environmentObject(nowPlatingPresenter)
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            window.tintColor = UIColor(.movieFont)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}

