//
//  SceneDelegate.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 19/04/24.
//

import UIKit

/// The delegate object for managing the app's scenes.
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var appCoordinator: Coordinator!
    var appFactory: AppFactory!
    let logger = AppLogger(subsystem: "com.hypadilla.testmercadolibre", category: "general")
    
    /// Tells the delegate that the scene is about to be displayed in a window.
    ///
    /// - Parameters:
    ///   - scene: The scene that is about to be displayed.
    ///   - session: The session object containing details about the scene's session.
    ///   - connectionOptions: The set of options for configuring the scene.
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let navigation = UINavigationController()
        window = UIWindow(windowScene: windowScene)
        appFactory = AppFactoryImp(logger: logger)
        appCoordinator = AppCoordinator(navigation: navigation, appFactory: appFactory, logger: logger, window: window)
        appCoordinator.start()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}
