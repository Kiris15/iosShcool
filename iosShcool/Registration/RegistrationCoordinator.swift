//
//  RegistrationCoordinator.swift
//  iosSchool
//
//  Created by Savely on 22.03.2023.
//

import UIKit

class RegistrationCoordinator: BaseCoordinator<RegistrationCoordinator.Context> {

  struct Context {
  }

  override func make() -> UIViewController {
    let controller = assembly.registrationVC()

    controller.backToAuth = { [weak controller] in
      controller?.dismiss(animated: true)
    }
    return controller
  }
}
