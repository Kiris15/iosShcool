//
//  AuthCoordinator.swift
//  iosSchool
//
//  Created by Savely on 20.03.2023.
//

import Foundation

import UIKit

class AuthCoordinator: BaseCoordinator<AuthCoordinator.Context> {

  struct Context {
  }

  override func make() -> UIViewController {
    let controller = assembly.authVC()
    return controller
  }
}