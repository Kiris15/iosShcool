//
//  AuthViewController.swift
//  iosSchool
//
//  Created by Savely on 20.03.2023.
//

import UIKit

class AuthViewController: UIViewController {

  private let dataProvider: AuthDataProvider

  init(dataProvider: AuthDataProvider) {
    self.dataProvider = dataProvider

    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

    override func viewDidLoad() {
        super.viewDidLoad()

      view.backgroundColor = .red
    }

}