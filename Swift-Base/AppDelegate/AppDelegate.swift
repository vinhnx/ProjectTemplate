//
//  AppDelegate.swift
//  Swift-Base
//

import UIKit
import UserNotifications
import IQKeyboardManagerSwift
@_exported import Then
@_exported import SwiftDate
@_exported import Localize_Swift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Instance Properties

    var window: UIWindow?

    // MARK: - Instance Methods

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.setupProject()

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) { }

    func applicationDidEnterBackground(_ application: UIApplication) { }

    func applicationWillEnterForeground(_ application: UIApplication) { }

    func applicationDidBecomeActive(_ application: UIApplication) { }

    func applicationWillTerminate(_ application: UIApplication) { }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    // MARK: - Remote notifications

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        self.saveRemoteNotificationTokenData(application, deviceToken: deviceToken)
    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) { }

    func requestForRemoteNotifications () {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: { [weak self] granted, error in
            guard granted else {
                return
            }

            self?.getNotificationSettings()
        })
    }
}

// MARK: - Settings

extension AppDelegate {

    // MARK: - Instance Methods

    private func setupProject() {
        IQKeyboardManager.shared.enable = true

        #if RELEASE
        Log.i(LogConsolePrinter.shared)
        #else
        Log.i(LogConsolePrinter.shared)
        #endif
    }
}

// MARK: - Push notifications

extension AppDelegate {

    // MARK: - Instance Methods

    private func saveRemoteNotificationTokenData(_ application: UIApplication, deviceToken: Data) {
        let tokenParts = deviceToken.map { data in
            String(format: "%02.2hhx", data)
        }

        let token = tokenParts.joined()

        Log.i("saveRemoteNotificationTokenData(token: \(token))")
    }

    private func getNotificationSettings() {
        UNUserNotificationCenter.current().getNotificationSettings(completionHandler: { settings in
            guard settings.authorizationStatus == .authorized else {
                return
            }

            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        })
    }
}
