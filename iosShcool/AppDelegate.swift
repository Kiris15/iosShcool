//
//  AppDelegate.swift
//  iosShcool
//
//  Created by Savely on 13.03.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  internal lazy var assembly = Assembly()

  func application(
          _ application: UIApplication,
          didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
      ) -> Bool {
          return true
      }

  func applicationWillTerminate(_ application: UIApplication) {
    assembly.storageManager.cleanKeychainIfNeeded()
  }
}
