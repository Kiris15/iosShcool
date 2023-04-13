//
//  LocationViewController.swift
//  iosSchool
//
//  Created by Savely on 03.04.2023.
//

import UIKit

class LocationViewController: UIViewController {
  private let dataProvider: LocationDataProvider

  init(dataProvider: LocationDataProvider) {
    self.dataProvider = dataProvider

    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    dataProvider.location() { [weak self] resut in
      switch resut {
      case .success(let success):
        print(success)
      case .failure(let failure):
        print(failure.rawValue)
      }
    }
  }
}