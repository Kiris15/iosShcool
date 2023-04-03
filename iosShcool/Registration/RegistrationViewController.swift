//
//  RegistrationViewController.swift
//  iosSchool
//
//  Created by Savely on 22.03.2023.
//

import UIKit

class RegistrationViewController: UIViewController {

  private let dataProvider: RegistrationDataProvider

  init(dataProvider: RegistrationDataProvider) {
    self.dataProvider = dataProvider

    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

    override func viewDidLoad() {
        super.viewDidLoad()

      view.backgroundColor = .red

      dataProvider.registration(username: "ann", password: "1111") { [weak self] resut in
        switch resut {
        case .success(let success):
          print("success")
        case .failure(let failure):
          print(failure.rawValue)
        }
      }
    }
}