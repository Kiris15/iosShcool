//
//  CharacterView.swift
//  iosSchool
//
//  Created by Savely on 21.04.2023.
//

import UIKit

protocol CharacterView: UIView {
  func makeViews()
  func update(data: CharacterViewData)
  func updateCharacter(url: String, with data: CharacterCellData)
}

class CharacterViewImp: UIView, CharacterView {

  private var data: [CharacterCellData] = []

  private lazy var collectionView: UICollectionView = {
    UICollectionView(frame: .zero, collectionViewLayout: layout())
  }()
  private let backgroundColorView: UIView = UIView(frame: .zero)

  func makeViews() {
    backgroundColor = .white

    backgroundColorView.backgroundColor = UIColor(named: "Lilac80")
    addSubview(backgroundColorView)
    backgroundColorView.translatesAutoresizingMaskIntoConstraints = false
    backgroundColorView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    backgroundColorView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    backgroundColorView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    backgroundColorView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

    collectionView.backgroundColor = .clear
    collectionView.dataSource = self
    collectionView.contentInset = UIEdgeInsets(top: 59, left: 0, bottom: 77, right: 0)

    let nib = UINib(nibName: CharacterCell.className, bundle: nil)
    collectionView.register(nib, forCellWithReuseIdentifier: CharacterCell.className)
    addSubview(collectionView)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
    collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true

  }

  func update(data: CharacterViewData) {
    self.data = data.cells
    collectionView.reloadData()
  }

  func updateCharacter(url: String, with data: CharacterCellData) {
    guard let index = self.data.firstIndex(where: { $0.url == url}) else {
      return
    }
    self.data[index] = data
    guard let cell = collectionView.cellForItem(at: .init(row: index, section: 0)) as? CharacterCell else {
      return
    }
    cell.viewModel = data
  }

  // MARK: - Private methods

  private func layout() -> UICollectionViewLayout {
    UICollectionViewCompositionalLayout(sectionProvider: provider())
  }

  private func provider() -> UICollectionViewCompositionalLayoutSectionProvider {
    { _, _ in
      let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(167))
      let item = NSCollectionLayoutItem(layoutSize: itemSize)
      let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(167))
      let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 2)
      group.interItemSpacing = .fixed(16)
      let section = NSCollectionLayoutSection(group: group)
      section.interGroupSpacing = 30
      return section
    }
  }
}

// MARK: - UICollectionViewDataSource

extension CharacterViewImp: UICollectionViewDataSource {
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    data.count
  }

  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: CharacterCell.className,
      for: indexPath
    ) as? CharacterCell else {
      return UICollectionViewCell()
    }
    guard data.count > indexPath.row else {
      return cell
    }
    cell.backgroundColor = UIColor(named: "CharacterCellBackground")
    cell.viewModel = data[indexPath.row]
    return cell
  }
}
